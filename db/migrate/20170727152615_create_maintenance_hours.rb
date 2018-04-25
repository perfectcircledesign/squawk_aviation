class CreateMaintenanceHours < ActiveRecord::Migration
  def change
    create_table :maintenance_hours do |t|
      t.integer :aircraft_id
      t.boolean :airframe
      t.boolean :power_plant
      t.boolean :fuel
      t.boolean :pneumatic
      t.boolean :hydraulics
      t.boolean :avionics
      t.boolean :electrical
      t.boolean :interiors
      t.integer :total_hours
      t.integer :customer_id

      t.timestamps
    end
  end
end
