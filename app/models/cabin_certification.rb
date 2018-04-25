class CabinCertification < ActiveRecord::Base
  self.table_name = 'cabin_certifications'

  AUTHORITIES = %w(ICAO FAA EASA OTHER)

  attr_accessible :CRM, :DG, :Ditching, :Fire_fighting, :SEPT, :customer_id, :file_id, :first_aid, :license_authority

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  belongs_to :file, :class_name=> '::Refinery::Resource'
end
