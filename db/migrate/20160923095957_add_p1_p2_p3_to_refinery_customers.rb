class AddP1P2P3ToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :p1, :float
    add_column :refinery_customers, :p2, :float
    add_column :refinery_customers, :p3, :float
  end
end
