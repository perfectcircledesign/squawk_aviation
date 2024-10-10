class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.string :company
      t.string :contact_details
      t.string :job_position
      t.integer :customer_id

      t.timestamps
    end
  end
end
