class AddExtraFieldsToRefineryAirlines < ActiveRecord::Migration
  def change
    add_column :refinery_airlines, :airline_name, :string
    add_column :refinery_airlines, :head_office_address, :text
    add_column :refinery_airlines, :logo_id, :integer
  end
end
