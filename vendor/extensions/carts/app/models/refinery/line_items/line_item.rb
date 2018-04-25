module Refinery
  module LineItems
    class LineItem < Refinery::Core::BaseModel
      self.table_name = 'refinery_line_items'

      attr_accessible :cart_id, :product_id, :quantity, :position

      belongs_to :cart, :class_name => '::Refinery::Carts::Cart'
      belongs_to :product, :class_name => '::Refinery::Products::Product'

      def title
        "line item for #{product.name}"
      end

      def calculate_product_discount(coupon)
        discount = total_price * coupon.discount_percentage/100

        discount
      end

      def total_price
        if product.present? and product.price.present?
          product.price * quantity
        else
          0
        end
      end

    end
  end
end
