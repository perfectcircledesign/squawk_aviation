class AddExtraMoreFieldsToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :turbine, :boolean, :default => false
    add_column :refinery_customers, :more_than, :boolean, :default => false
  end
end
