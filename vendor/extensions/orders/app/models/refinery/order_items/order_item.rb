module Refinery
  module OrderItems
    class OrderItem < Refinery::Core::BaseModel
      self.table_name = 'refinery_order_items'

      belongs_to :order, :class_name => '::Refinery::Orders::Order'

      attr_accessible :product_name, :product_stock_code, :product_supplier_stock_code, :price, :order_id, :quantity, :total, :position

      acts_as_indexed :fields => [:product_name, :product_stock_code, :product_supplier_stock_code]

      validates_presence_of :order_id, :product_name, :price, :quantity, :total
      validates_numericality_of :price, :quantity, :total

    end
  end
end
