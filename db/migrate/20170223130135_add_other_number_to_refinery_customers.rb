class AddOtherNumberToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :other_number, :string
  end
end
