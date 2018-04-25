class CreateAviationRecords < ActiveRecord::Migration
  def change
    create_table :aviation_records do |t|
      t.string :employer
      t.string :aircraft
      t.date :start_date
      t.date :end_date
      t.string :ca
      t.string :fo
      t.string :total
      t.string :reason_for_leaving
      t.integer :customer_id

      t.timestamps
    end
  end
end
