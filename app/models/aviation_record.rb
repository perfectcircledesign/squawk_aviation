class AviationRecord < ActiveRecord::Base
  self.table_name = 'aviation_records'
  attr_accessible :aircraft, :position_held, :notice_period, :ca, :customer_id, :employer, :end_date, :fo, :reason_for_leaving, :start_date, :total, :current_work

  # validates_presence_of :employer, :start_date

  POSITION_HELD = ["P1 - Captain", "P2 - First officer", "P3/SE - Cruise only", "Flight attendant", "Purser", "Chief purser", "Maintenance Eng - airframe", "Maintenance Eng - Power Plant", "Maintenance Eng - Fuel", "Maintenance Eng - Pneumatic", "Maintenance Eng - Hydraulics", "Maintenance Eng - Avionics", "Maintenance Eng - Electrical", "Maintenance Eng - Interior incl Air-con", "Other"]

  NOTICEPERIOD = %w(7\ Days 14\ Days 30\ Days 60\ Days Calendar\ Month Other)

  REASONS = %w(Better\ Employment\ Prospect Command\ Opportunity Looking\ for\ New\ Challenges Company\ Closed Current\ Position\ was\ Outsourced Want\ a\ more\ Permanent\ Contract\ Position Retrenched\ /\ Fired)

  belongs_to :customer, :class_name => 'Refinery::Customers::Customer'
end
