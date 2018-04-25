module Refinery
  module Invoices
    class Invoice < Refinery::Core::BaseModel
      self.table_name = 'refinery_invoices'      
    
      acts_as_indexed :fields => [:invoice_number, :trans_number, :sub_type, :start_date, :end_date, :price_dollar, :price_rand, :card_last_digits]

      attr_accessible :invoice_number, :trans_number, :sub_type, :start_date, :end_date, :price_dollar, :price_rand, :card_last_digits, :customer_id, :position

      # validates :invoice_number, :presence => true

      belongs_to :customer, :class_name => '::Refinery::Customers::Customer'

      def invoice_number
        "SQUAWK%05d" % id
      end
              
    end
  end
end
