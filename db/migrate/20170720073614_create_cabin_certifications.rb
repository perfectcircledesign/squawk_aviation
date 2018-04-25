class CreateCabinCertifications < ActiveRecord::Migration
  def change
    create_table :cabin_certifications do |t|
      t.string :license_authority
      t.boolean :first_aid
      t.boolean :CRM
      t.boolean :SEPT
      t.boolean :DG
      t.boolean :Ditching
      t.boolean :Fire_fighting
      t.integer :file_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
