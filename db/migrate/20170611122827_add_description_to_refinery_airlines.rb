class AddDescriptionToRefineryAirlines < ActiveRecord::Migration
  def change
    add_column :refinery_airlines, :description, :text
  end
end
