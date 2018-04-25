class CreateFlyingHoursCabins < ActiveRecord::Migration
  def change
    create_table :flying_hours_cabins do |t|
      t.integer :aircraft_id
      t.date :date_first_flown
      t.date :date_last_flown
      t.string :total_hours
      t.integer :customer_id

      t.timestamps
    end
  end
end
