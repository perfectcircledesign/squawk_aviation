class CreateAviationCertificationDetails < ActiveRecord::Migration
  def change
    create_table :aviation_certification_details do |t|
      t.string :license_type
      t.string :license_number
      t.string :country_of_issue
      t.date :date_of_issue
      t.date :date_of_expiry
      t.integer :customer_id

      t.timestamps
    end
  end
end
