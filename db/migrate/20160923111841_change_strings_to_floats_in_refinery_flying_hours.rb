class ChangeStringsToFloatsInRefineryFlyingHours < ActiveRecord::Migration
  def change
    remove_column :flying_hours, :ca
    remove_column :flying_hours, :fo
    remove_column :flying_hours, :cruise_only_pilot

    add_column :flying_hours, :ca, :float
    add_column :flying_hours, :fo, :float
    add_column :flying_hours, :cruise_only_pilot, :float
  end
end
