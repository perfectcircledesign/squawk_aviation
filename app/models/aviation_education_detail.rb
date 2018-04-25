class AviationEducationDetail < ActiveRecord::Base
  self.table_name = 'aviation_education_details'
  attr_accessible :customer_id, :institution, :period, :program, :education_type

  EDTYPES = %w(Basic Tertiary )
  PROGRAMS = %w(School\ Leaving Grade\ 12 Certificate Diploma Degree Masters Honours Doctorate Other)

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
end
