class CreditCard < ActiveRecord::Base
  self.table_name = 'credit_cards'

  attr_accessible :bin, :brand, :customer_id, :exp_month, :exp_year, :holder, :last_digits, :token, :card_number

  attr_accessor :card_number

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  has_one :subscription, :class_name => 'Refinery::Subscriptions::Subscription'
end
