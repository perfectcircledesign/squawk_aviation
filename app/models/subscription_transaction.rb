class SubscriptionTransaction < ActiveRecord::Base
  self.table_name = 'subscription_transactions'

  attr_accessible :amount, :credit_card_id, :customer_id, :notes, :subscription_id, :transaction_status

  belongs_to :subscription, :class_name => 'Refinery::Subscriptions::Subscription'

  has_many :trans_logs, :class_name => 'TransLog'

end
