module Refinery
  module Carts
    class Cart < Refinery::Core::BaseModel
      self.table_name = 'refinery_carts'

      attr_accessible :customer_id, :is_current, :position

      before_save :check_is_current

      belongs_to :customer, :class_name => '::Refinery::Customers::Customer'
      belongs_to :coupon, :class_name => "::Refinery::Coupons::Coupon"
      has_many :line_items, :class_name => '::Refinery::LineItems::LineItem'
      has_many :products, :through => :line_items, :class_name => '::Refinery::Products::Product'

      scope :current, where(:is_current => true)

      def title
        "Cart for customer_id: #{self.customer_id}"
      end



      def calculate_discount(total)
        discount = 0
        if coupon.present? and coupon.discount_percentage.present?
          discount = total * coupon.discount_percentage/100
        else
          discount = coupon.discount_amount.to_f
        end
        discount
      end

      def grand_total_after_discount(grand_total, current_coupon)
        if current_coupon.present?
          if current_coupon.discount_type == "product"
            a1 = self.line_items.pluck(:product_id)
            a2 = current_coupon.products.collect{ |p| p.id}
            if a2-a1 != a2
              discount = 0
              line_items.each do |line_item|
                if a2.include?(line_item.product_id)
                  discount += line_item.calculate_product_discount(current_coupon)
                end
              end

              grand_total = grand_total - discount
            end
          else
            if coupon.present?
              grand_total = grand_total - calculate_discount(grand_total)
            end
          end
        end
        grand_total
      end

      def grand_total
        total = 0
        line_items.each do |li|
          total += li.total_price
        end
        total
      end

      def total_items
        total = 0
        line_items.each do |li|
          total += li.quantity
        end
        total
      end

      def total_weight
        total = 0
        line_items.each do |li|
          if li.product.weight.present?
            total += (li.product.weight * li.quantity)
          else
            total += 1 * li.quantity
          end
        end
        total
      end

      def add_to_the_cart(product_id, quantity=1)

        quantity = 1

        li = self.line_items.where(:product_id => product_id).first

        if li.blank?
          self.line_items.create!(:product_id => product_id, :quantity => quantity)
        end
      end

      def check_is_current
        if is_current.present? and is_current == true and customer_id.present?
          other_carts = Cart.where(:customer_id => self.customer_id)
          other_carts.each do |cart|
            cart.update_attributes(:is_current => false) if cart.id != self.id
          end
        end
      end

      def merge_other_cart(other_cart)
        other_cart.line_items.each do |li|
          self.add_to_the_cart(li.product_id, li.quantity)
        end
      end

    end
  end
end
