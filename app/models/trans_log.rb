class TransLog < ActiveRecord::Base
  self.table_name = 'trans_logs'

  attr_accessible :request, :response, :subscription_transaction_id

  belongs_to :subscription_transaction, :class_name => 'SubscriptionTransaction'
end
