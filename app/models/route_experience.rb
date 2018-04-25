class RouteExperience < ActiveRecord::Base
  self.table_name = 'route_experiences'
  attr_accessible :city_destinations, :continent_flown_to, :customer_id

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
end
