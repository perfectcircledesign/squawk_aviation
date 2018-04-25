module Refinery
  module Transactions
    class Transaction < Refinery::Core::BaseModel
      self.table_name = 'refinery_transactions'
      attr_accessible :order_id, :amount, :notes, :unique_guid
      acts_as_indexed :fields => [:notes, :unique_guid]

      belongs_to :order, :class_name => "::Refinery::Orders::Order"

      validates_presence_of :order_id, :amount, :unique_guid

      scope :successful, where(:is_payment_successful => true)

      def credit_card_payment_received!(params)
        self.is_payment_successful = true
        self.notes = build_notes(params)
        self.save!

        self.order.credit_card_payment_received!
      end

      def log_failure!(params)
        self.notes = build_notes(params)
        self.save!
      end

      private

      def build_notes(params)
        values = []

        ['p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7', 'p8', 'p9', 'p10','p11','p12','p13','CardHolderIpAddr','TransactionType','Uti'].each do |p|
          values << "#{p}: #{params[p]}"
        end

        values.join(';')
      end
    end
  end
end
