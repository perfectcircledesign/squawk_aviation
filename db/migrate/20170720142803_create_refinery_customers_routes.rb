class CreateRefineryCustomersRoutes < ActiveRecord::Migration
  def up
    create_table :refinery_customers_routes, :id => false do |t|
      t.integer :customer_id
      t.integer :route_experience_id
    end

    add_index :refinery_customers_routes, :customer_id
    add_index :refinery_customers_routes, :route_experience_id

  end

  def down
    drop_table :refinery_customers_routes
  end
end
