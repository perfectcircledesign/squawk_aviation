class BlacklistCustomer < ActiveRecord::Base
  self.table_name = 'refinery_airlines_customers'

  attr_accessible :airline_id, :customer_id

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  belongs_to :airline, :class_name => 'Refinery::Airlines::Airline'
end
