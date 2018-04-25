class AddValidAirlineToRefineryAirline < ActiveRecord::Migration
  def change
    add_column :refinery_airlines, :valid_airline, :boolean, :default => false
  end
end
