class MaintenanceCertification < ActiveRecord::Base
  self.table_name = 'maintenance_certifications'

  AUTHORITIES = %w(ICAO FAA EASA OTHER)

  TYPES = ['Category A','Category B','Category C','Category D','Category E','Category W','Category X']

  attr_accessible :customer_id, :file_id, :license_authority, :license_type

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  belongs_to :file, :class_name=> '::Refinery::Resource'

  def endorsements
  	license_type
  end
end
