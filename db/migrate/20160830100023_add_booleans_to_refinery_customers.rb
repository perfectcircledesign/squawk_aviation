class AddBooleansToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :register_for_wholesale, :boolean
    add_column :refinery_customers, :is_wholesale, :boolean
  end
end
