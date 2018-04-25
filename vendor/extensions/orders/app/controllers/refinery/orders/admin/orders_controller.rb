module Refinery
  module Orders
    module Admin
      class OrdersController < ::Refinery::AdminController

        crudify :'refinery/orders/order',
                :title_attribute => 'order_number', :xhr_paging => true

        def show
          @order = Order.find(params[:id])
        end

        def index
          if params[:order_status].present?
            @orders = Order.where(:order_status => params[:order_status]).order("created_at DESC").paginate(:page => params[:page])
          else
            @orders = Order.order("created_at DESC").paginate(:page => params[:page])
          end
        end

        def notification_recipients

          @recipients = ::Refinery::Setting.find_or_set(:order_notification_recipients,
                                                    ((::Refinery::Role[:refinery].users.first.email rescue nil) if defined?(::Refinery::Role)).to_s)

          if request.post?

            flash[:notice] = "The notification recipients have successfully been updated"
            unless request.xhr? or from_dialog?
              redirect_back_or_default(admin_orders_path)
            else
              render :text => "<script type='text/javascript'>parent.window.location = '#{admin_orders_path}';</script>",
                     :layout => false
            end
          end
        end

        def update_awaiting_eft
          update_status("Awaiting EFT Payment")
        end

        def update_awaiting_cc
          update_status("Awaiting Credit Card Payment")
        end

        def update_new
          order = Order.find(params[:order_id])

          if params[:payment_type].present?
            if params[:payment_type] == "EFT"
              #OrderMailer.customer_cash_received(order.customer, order).deliver
              Notifier.payment_confirmation(order).deliver
            elsif params[:payment_type] == "Credit Card"
              #OrderMailer.admin_credit_received(order.customer, order).deliver
              Notifier.payment_confirmation(order).deliver
            end
          end



          update_status("New")
        end

        def update_processing
          update_status("Processing")

        end

        def update_complete
          order = Order.find(params[:order_id])
          update_status("Complete")
          Notifier.order_complete(order).deliver

        end

        def update_cancelled
          update_status("Cancelled")

        end

        def update_stale
          update_status("Stale")

        end

        def picking_report
          @orders = Order.where(:order_status => "New")
          render :layout => false
        end

        def labelling_report
          @orders = Order.where(:order_status => "New")
          render :layout => false
        end

        def invoicing_report
          @orders = Order.where(:order_status => "New")

          render :layout => false
        end

        def mark_all_as_processing
          orders = Order.where(:order_status => "New")
          orders.each do |order|
            order.order_status = "Processing"
            order.save!
          end
          redirect_to refinery.orders_admin_orders_path
        end

        def print_invoice
          @order = Order.find(params[:order_id])
          render :layout => false
        end

        def print_waybill
          @order = Order.find(params[:order_id])
          render :layout => false
        end

        def export
          @orders = Order.order(:id)
          respond_to do |wants|
            wants.csv do
              render_csv("orders-#{Time.now.strftime("%Y%m%d")}")
            end
          end
        end

        # P R I V A T E
        private

        def render_csv(filename = nil, action = nil)
          filename ||= params[:action]
          filename += '.csv'

          if request.env['HTTP_USER_AGENT'] =~ /msie/i
            headers['Pragma'] = 'public'
            headers["Content-type"] = "text/plain"
            headers['Cache-Control'] = 'no-cache, must-revalidate, post-check=0, pre-check=0'
            headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
            headers['Expires'] = "0"
          else
            headers["Content-Type"] ||= 'text/csv'
            headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""
          end

          if action.present?
            render :layout => false, :action => action
          else
            render :layout => false
          end
        end

        def update_status(status)
          order = Order.find(params[:order_id])
          order.order_status = status
          order.save!

          redirect_to refinery.orders_admin_order_path(order)
        end
      end
    end
  end
end
