class AviationCertificationDetail < ActiveRecord::Base
  self.table_name = 'aviation_certification_details'
  attr_accessible :country_of_issue, :aviation_file, :file_id, :date_of_expiry, :date_of_issue, :license_number, :license_type, :customer_id, :license_authority, :mcc, :dangerous_goods, :crm, :tcas_acas, :lvo, :rnav_gnss, :rvsm, :cfit_gpws, :etops

  AUTHORITIES = %w(ICAO FAA EASA OTHER)
  TYPES = %w(Single\ Engine\ CPL\ VFR Multi\ Engine\ CPL\ VFR Single\ Engine\ CPL\ I.R Multi\ Engine\ CPL\ I.R Multi\ Engine\ CPL\ I.R\ +\ ATPL(Frozen) Multi\ Engine\ CPL\ I.R\ +\ ATPL MPL Other)

  attr_accessor :aviation_file

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
  belongs_to :file, :class_name=> '::Refinery::Resource'


  def endorsements
  	arr = []
		arr << 'MCC' if self.mcc
    arr << 'Dangerous Goods' if self.dangerous_goods
    arr << 'CRM' if self.crm
    arr << 'TCAS/ACAS' if self.tcas_acas
    arr << 'LVO' if self.lvo
    arr << 'RNAV,GNSS' if self.rnav_gnss
    arr << 'RVSM' if self.rvsm
    arr << 'CFIT/GPWS' if self.cfit_gpws
    arr << 'ETOPS' if self.etops
    arr
  end
end
