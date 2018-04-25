class AddFieldsToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :province, :string
    add_column :refinery_customers, :sport, :string
  end
end
