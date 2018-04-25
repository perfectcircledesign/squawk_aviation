class AddExtrFieldsToFlyingHoursCabins < ActiveRecord::Migration
  def change
    add_column :flying_hours_cabins, :flight_attendant, :integer
    add_column :flying_hours_cabins, :purser, :integer
    add_column :flying_hours_cabins, :chief_purser, :integer
  end
end
