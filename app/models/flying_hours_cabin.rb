class FlyingHoursCabin < ActiveRecord::Base
  self.table_name = 'flying_hours_cabins'

  attr_accessible :aircraft_id, :customer_id, :date_first_flown, :date_last_flown, :total_hours, :flight_attendant, :purser, :chief_purser 

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  belongs_to :aircraft, :class_name => 'Refinery::Aircrafts::Aircraft'
end
