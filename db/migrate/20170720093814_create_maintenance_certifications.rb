class CreateMaintenanceCertifications < ActiveRecord::Migration
  def change
    create_table :maintenance_certifications do |t|
      t.string :license_authority
      t.string :license_type
      t.integer :customer_id
      t.integer :file_id

      t.timestamps
    end
  end
end
