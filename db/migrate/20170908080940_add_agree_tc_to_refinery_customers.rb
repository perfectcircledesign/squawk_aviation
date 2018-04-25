class AddAgreeTcToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :agree_tc, :boolean
  end
end
