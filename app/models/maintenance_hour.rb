class MaintenanceHour < ActiveRecord::Base
  self.table_name = 'maintenance_hours'

  attr_accessible :aircraft_id, :airframe, :avionics, :customer_id, :electrical, :fuel, :hydraulics, :interiors, :pneumatic, :power_plant, :total_hours

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  belongs_to :aircraft, :class_name => 'Refinery::Aircrafts::Aircraft'
end
