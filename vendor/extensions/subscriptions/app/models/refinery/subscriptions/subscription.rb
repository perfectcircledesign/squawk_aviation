module Refinery
  module Subscriptions
    class Subscription < Refinery::Core::BaseModel
      self.table_name = 'refinery_subscriptions'      
    
      acts_as_indexed :fields => [:customer_id]

      attr_accessible :customer_id, :exp_date, :plan_id, :position, :credit_card_id, :plan_name, :fail_payment_count

      validates :customer_id, :presence => true

      belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
      belongs_to :plan, :class_name => 'Refinery::Plans::Plan'
      belongs_to :credit_card, :class_name => 'CreditCard'

      has_many :subscription_transactions, :class_name => 'SubscriptionTransaction'

      scope :new_billing, where('exp_date <= ?', Time.now)

      def plan_name
        exp_date
      end

    end
  end
end
