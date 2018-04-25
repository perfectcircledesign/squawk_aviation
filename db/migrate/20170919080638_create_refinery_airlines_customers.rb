class CreateRefineryAirlinesCustomers < ActiveRecord::Migration
  def change
    # drop_table :refinery_airlines_customers

    create_table :refinery_airlines_customers do |t|
      t.integer :customer_id
      t.integer :airline_id

      t.timestamps
    end

    add_index :refinery_airlines_customers, :customer_id
    add_index :refinery_airlines_customers, :airline_id

  end

  # def down
  #   drop_table :refinery_airlines_customers
  # end
end
