class AddAircraftIdToFlyingHours < ActiveRecord::Migration
  def change
    add_column :flying_hours, :aircraft_id, :integer
  end
end
