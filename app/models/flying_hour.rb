class FlyingHour < ActiveRecord::Base
  self.table_name = 'flying_hours'
  attr_accessible :ca, :cruise_only_pilot, :customer_id, :date_first_flown, :date_last_flown, :fo, :mtow, :total, :aircraft_id
  # validates_presence_of :aircraft_id

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  belongs_to :aircraft, :class_name => 'Refinery::Aircrafts::Aircraft'


  def total_hours
  	total
  end
end
