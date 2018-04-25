module Refinery
  module Orders
    class OrdersController < ::ApplicationController
      before_filter :authenticate_customer!, :except => [:payment_response]
      before_filter :sign_the_customer_in, :only => [:payment_response]
      before_filter :get_delivery_option

      def show
        @order = Order.find(params[:id])
        if @order.customer_id != current_customer.id
          flash[:alert] = "You are not authorised to view that order."
          redirect_to root_path
        end
      end

      def new


        init_new_order

        @page = ::Refinery::Page.where(:link_url => "/orders/new").first
        present(@page)
      end

      def create
        if params[:coupon].present?
          coupon = ::Refinery::Coupons::Coupon.find_by_coupon_code(params[:coupon].upcase)
          coupon_amount = params[:coupon_amount]
        else
          coupon = nil
          coupon_amount = nil
        end

        @order = save_cart_to_order(@current_cart, params[:payment_type], coupon, coupon_amount)

        if is_eft_payment?(params[:payment_type])
          clear_cart
          Notifier.order_invoice(@order).deliver
          Notifier.admin_order_complete(@order).deliver
          render :action => :success
        else
          #Notifier.order_invoice(@order).deliver
          redirect_to refinery.orders_order_submit_to_gateway_path(@order)
        end
      end

      def submit_to_gateway
        @unique_guid = rand(36**8).to_s(36) + Time.now.strftime("%Y%m%d%I%M%S")
        @order = Order.find(params[:order_id])
        ::Refinery::Transactions::Transaction.create!(:unique_guid => @unique_guid, :order_id => @order.id, :amount => @order.grand_total)
        render :layout => false
      end

      def submit_to_tracker
        @waybill = params[:waybill].to_i
        render :layout => false
      end

      def get_delivery_option
        if params[:delivery_method].present?
          @delivery_option = ::Refinery::DeliveryOptions::DeliveryOption.find_by_id(params[:delivery_method])
          session[:delivery_method] =  params[:delivery_method]
        elsif session[:delivery_method].present?
          if current_customer.present? and current_customer.is_wholesale
            @delivery = ::Refinery::DeliveryOptions::DeliveryOption.find_by_id(session[:delivery_method])
            if @delivery.present? and @delivery.merchandiser == 'wholesale'
              @delivery_option = @delivery
            else
              session[:delivery_method] = nil
            end
          else
            @delivery = ::Refinery::DeliveryOptions::DeliveryOption.find_by_id(session[:delivery_method])
            if @delivery.present? and @delivery.merchandiser == 'retail'
              @delivery_option = @delivery
            else
              session[:delivery_method] = nil
            end
          end
        end
      end

      def find_coupon
        @coupon = ::Refinery::Coupons::Coupon.find_by_coupon_code(params[:coupon].upcase)
        if @coupon.present?
           member_orders = ::Refinery::Orders::Order.where(:customer_id => current_customer.id)

          if member_orders.all.map{ |a| a.coupon_name.present? and (a.coupon_name.upcase == @coupon.coupon_code.upcase)}.include? true
            flash[:alert] = "This coupon has already been used"
            @coupon = nil
          else
            coupon_used = ::Refinery::Orders::Order.where(:coupon_name => @coupon.coupon_code.upcase).not_canceled.not_stale.count()
            if @coupon.quantity.present? and @coupon.quantity.to_i <= coupon_used and @coupon.quantity.to_i != 0
              flash[:alert] = "This coupon has already expired, sorry"

              @coupon = nil
            elsif @coupon.expiry_date < Time.now()
              flash[:alert] = "This coupon has already expired, sorry"

              @coupon = nil
            else
              if @coupon.discount_type == "cart"
                @current_cart.coupon_id = @coupon.id
                @current_cart.save!
                flash[:alert] = "Coupon will be applied to your cart"
              elsif @coupon.discount_type == "product"
                a1 = @current_cart.line_items.pluck(:product_id)
                logger.info("******************* a1 #{a1}")
                a2 = @coupon.products.collect{ |p| p.id}
                logger.info("******************* a2 #{a2}")
                logger.info("******************* a2-a1 #{a2-a1}")
                logger.info("******************* is a2-a1 = a2? : #{a2-a1 == a2}")
                if a2-a1 == a2
                  flash[:alert] = "Coupon applies to a product not currently in your cart"

                  @coupon = nil
                else
                  flash[:alert] = "Coupon will be applied to one or more products"
                end
              end
            end
          end
        else
          flash[:alert] = "Unable to locate that coupon code"
        end
        render :new
      end

      def remove_coupon
        @coupon = ::Refinery::Coupons::Coupon.find_by_coupon_code(params[:coupon].upcase)
        if @coupon.present?
          if @coupon.discount_type == "cart"
            @current_cart.coupon_id = nil
            @current_cart.save!
            flash[:alert] = "Coupon has been removed from your cart"
          elsif @coupon.discount_type == "product"
            flash[:alert] = "Coupon has been removed from your cart"
          end
        end
        @coupon = nil
        render :new
      end

      def payment_response
        transaction = ::Refinery::Transactions::Transaction.find_by_unique_guid(params['p2'])
        if transaction.present?
          if Paygate::Paygate.is_payment_successful?(params)
            transaction.credit_card_payment_received!(params)
            clear_cart

            @order = transaction.order
            Notifier.admin_order_complete(@order).deliver
            render :success
          else
            transaction.log_failure!(params)
            render :payment_fail
          end
        else
          raise Exception "Unable to find transaction from params: #{params.inspect}"
        end
      end

      def payment_successful
        transaction = ::Refinery::Transactions::Transaction.find_by_unique_guid(params['p2'])
        if transaction.present?
          transaction.credit_card_payment_received!(params)
          clear_cart

          @order = transaction.order
          Notifier.admin_order_complete(@order).deliver
          render :payment_successful
        else
          raise Exception "Unable to find transaction from params: #{params.inspect}"
        end

      end

      def successful

      end

      def payment_fail
        transaction = ::Refinery::Transactions::Transaction.find_by_unique_guid(params['p2'])
        if transaction.present?
          transaction.log_failure!(params)

          @order = transaction.order
          @order.order_status = 'Cancelled'
          @order.save!

          render :payment_fail
        else
          raise Exception "Unable to find transaction from params: #{params.inspect}"
        end
      end



      def print_invoice
        @order = Order.find(params[:order_id])
        render :layout => false
      end

      # P R I V A T E
      private

      # We need to sign the customer in ourselves, since iVeri is not sending the relevant data back to us to do so.
      def sign_the_customer_in
        transaction = ::Refinery::Transactions::Transaction.find_by_unique_guid(params['REFERENCE'])
        sign_in(:customer, ::Refinery::Customers::Customer.find(transaction.order.customer_id))
        @current_cart = get_cart # get the cart again now that the customer is signed in.

        #@order = Order.find(params[:order_id])
        #if params['CUSTOMER_ID'].present? and @order.customer.id.to_s == params['CUSTOMER_ID'].to_s
        #  sign_in(:customer, ::Refinery::Customers::Customer.find(params['CUSTOMER_ID']))
        #  @current_cart = get_cart # get the cart again now that the customer is signed in.
        #else
        #  flash[:alert] = "You are not authorised to view that order's details"
        #  redirect_to refinery.root_path
        #end
      end

      def init_new_order

      end

      def is_eft_payment?(payment_type)
        payment_type == 'EFT'
      end

      def save_cart_to_order(cart, payment_type, coupon=nil, coupon_amount=nil)

        delivery_option = ::Refinery::DeliveryOptions::DeliveryOption.find_by_id(session[:delivery_method])
        grand_total = delivery_option.grand_total_for_cart(cart, coupon)
        address = current_customer.current_address
        order_status = is_eft_payment?(payment_type) ? 'Awaiting EFT Payment' : 'Awaiting Credit Card Payment'

        coupon_description = nil
        coupon_discount_amt = nil
        name_of_coupon = nil

        if coupon.present?
          coupon.discount_type == "cart" ? coupon_type = coupon.discount_type : coupon_type = coupon.products.collect{ |p| p.name }.join(", ")
          name_of_coupon = coupon.coupon_code
          coupon_description = "Voucher Discount: ("+coupon.discount_percentage.to_s+"% off "+coupon_type+" until "+coupon.expiry_date.strftime("%d %B %Y")+")"
          coupon_discount_amt = coupon_amount
        end

        order = create_order(current_customer, order_status, payment_type, address, grand_total, delivery_option.name_for_cart(cart, coupon), delivery_option.cost_for_cart(cart, coupon), coupon_description, coupon_discount_amt, name_of_coupon)

        cart.line_items.each do |cart_item|
          product_name = cart_item.product.name
          product_price = cart_item.product.price
          quantity = cart_item.quantity
          total = quantity * product_price
          stock_code = cart_item.product.stock_code
          create_order_item(order.id, product_name, product_price, quantity, stock_code, total)
        end

        order
      end

      def clear_cart
        cart = get_cart
        cart.is_current = false
        cart.save!
        session[:cart_id] = nil
      end

      def create_order(customer, order_status, payment_type, address, grand_total, delivery_option_name=nil, delivery_cost=nil, coupon_description=nil, coupon_discount_amt=nil, name_of_coupon=nil)

        order = Order.create!(:customer_id => customer.id, :order_status => order_status, :payment_type => payment_type, :address_line_1 => address.line_1, :address_line_2 => address.line_2,
                      :city => address.city, :postal_code => address.postal_code,  :suburb => address.suburb,
                      :grand_total => grand_total, :delivery_option_name => delivery_option_name, :delivery_cost => delivery_cost,
                      :coupon_description => coupon_description, :coupon_discount_amount => coupon_discount_amt, :coupon_name => name_of_coupon)

        # order = Order.last

        #if payment_type == "Cash"
        #  OrderMailer.customer_new_order(customer, order).deliver
        #  OrderMailer.admin_new_order(customer, order).deliver
        #elsif payment_type == "Credit Card"
        #  OrderMailer.customer_new_credit_order(customer, order).deliver
        #end

        #order
      end

      def create_order_item(order_id, product_name, product_price, quantity, stock_code, total)
        ::Refinery::OrderItems::OrderItem.create!(:order_id => order_id, :product_name => product_name, :price => product_price, :quantity => quantity, :product_stock_code => stock_code, :total => total)
      end

    end
  end
end
