module Refinery
  module Orders
    class Order < Refinery::Core::BaseModel
      self.table_name = 'refinery_orders'
      after_create :generate_reference_number

      belongs_to :customer, :class_name => '::Refinery::Customers::Customer'
      has_many :order_items, :class_name => '::Refinery::OrderItems::OrderItem'
      has_many :transactions, :class_name => "::Refinery::Transactions::Transaction"

      attr_accessible :order_number, :customer_id, :order_status, :grand_total, :address_line_1, :address_line_2, :suburb, :city, :postal_code,
                      :payment_type, :coupon_name, :position, :delivery_option_name, :delivery_cost, :delivery_waybill_number, :coupon_description, :coupon_discount_amount

      acts_as_indexed :fields => [:order_number, :order_status, :address_line_1, :address_line_2, :suburb, :city, :postal_code, :payment_type, :delivery_option_name, :delivery_waybill_number]

      STATUSES = ['Awaiting EFT Payment', 'Awaiting Credit Card Payment', 'New', 'Processing', 'Complete', 'Cancelled', 'Stale']
      PAYMENT_TYPES = ['EFT', 'Credit Card']

      validates_inclusion_of :order_status, :in => STATUSES
      validates_inclusion_of :payment_type, :in => PAYMENT_TYPES

      scope :all_but_awaiting_credit_card, lambda {
        tmp_statuses = STATUSES.dup
        tmp_statuses.delete('Awaiting Credit Card Payment')
        where(:order_status => tmp_statuses)
      }

      def credit_card_payment_received!
        self.order_status = 'New'
        self.save!

        Notifier.order_invoice(self).deliver
      end

      private

      def generate_reference_number
        self.order_number = "CVH%05d" % id
        self.save!
      end

      scope :not_stale, where(:order_status != 'Stale')
      scope :not_canceled, where(:order_status != 'Cancelled')

    end
  end
end
