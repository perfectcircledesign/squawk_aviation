class CreateFavourites < ActiveRecord::Migration
  def change
    create_table :favourites do |t|
      t.integer :customer_id
      t.integer :airline_id
      t.integer :job_id
      t.string :who_favourite

      t.timestamps
    end
  end
end
