class AddAllotOfFieldsToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :dob, :string
    add_column :refinery_customers, :age, :integer
    add_column :refinery_customers, :nationality, :string
    add_column :refinery_customers, :gender, :string
    add_column :refinery_customers, :ppc_date, :date
    add_column :refinery_customers, :ppc_expiry_date, :date
    add_column :refinery_customers, :ir_date, :date
    add_column :refinery_customers, :ir_expiry_date, :date
    add_column :refinery_customers, :total_flying_time, :string
    add_column :refinery_customers, :pass_12_months_hours_flown, :string
    add_column :refinery_customers, :dual_nationality_details, :string
    add_column :refinery_customers, :marital_period, :string
    add_column :refinery_customers, :notice_period, :string
    add_column :refinery_customers, :icao, :string
    add_column :refinery_customers, :military_commitment, :boolean
    add_column :refinery_customers, :previously_interviewed, :boolean
    add_column :refinery_customers, :previously_employed, :boolean
    add_column :refinery_customers, :any_aircraft_accident, :boolean
    add_column :refinery_customers, :any_criminal_records, :boolean
    add_column :refinery_customers, :current_position, :string
    add_column :refinery_customers, :current_aircraft, :string
    add_column :refinery_customers, :current_airline, :string
    add_column :refinery_customers, :address, :text
    add_column :refinery_customers, :customer_country, :string
    add_column :refinery_customers, :interviewed_if_yes, :string
    add_column :refinery_customers, :employed_if_yes, :string
    add_column :refinery_customers, :accident_if_yes, :text
    add_column :refinery_customers, :online_application_number, :string
  end
end
