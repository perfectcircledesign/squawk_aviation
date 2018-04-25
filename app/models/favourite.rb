class Favourite < ActiveRecord::Base
  self.table_name = 'favourites'

  attr_accessible :airline_id, :customer_id, :job_id, :who_favourite

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  belongs_to :airline, :class_name => 'Refinery::Airlines::Airline'
  belongs_to :jobs, :class_name => 'Refinery::Airlines::Airline'
end
