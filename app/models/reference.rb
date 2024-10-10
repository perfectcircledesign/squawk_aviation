class Reference < ActiveRecord::Base
  self.table_name = 'references'

  attr_accessible :company, :contact_details, :customer_id, :job_position, :name, :email

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
end
