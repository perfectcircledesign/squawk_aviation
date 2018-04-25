class ChangeCustomerTotalFlyingTimeToInteger < ActiveRecord::Migration
  def up
    remove_column :refinery_customers, :total_flying_time
    add_column :refinery_customers, :total_flying_time, :integer
  end

  def down
    remove_column :refinery_customers, :total_flying_time
    add_column :refinery_customers, :total_flying_time, :integer
  end
end
