class AddCustomerIdToRefineryCustomerFiles < ActiveRecord::Migration
  def change
    add_column :refinery_customer_files, :customer_id, :integer
  end
end
