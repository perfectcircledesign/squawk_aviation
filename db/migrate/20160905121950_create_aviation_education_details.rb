class CreateAviationEducationDetails < ActiveRecord::Migration
  def change
    create_table :aviation_education_details do |t|
      t.string :program
      t.string :institution
      t.string :period
      t.integer :customer_id

      t.timestamps
    end
  end
end
