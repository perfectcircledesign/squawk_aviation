class CreateFlyingHours < ActiveRecord::Migration
  def change
    create_table :flying_hours do |t|
      t.string :mtow
      t.string :aircraft
      t.date :date_first_flown
      t.date :date_last_flown
      t.string :ca
      t.string :fo
      t.string :total
      t.string :cruise_only_pilot
      t.integer :customer_id

      t.timestamps
    end
  end
end
