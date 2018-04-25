class AddLastNotifyIdToCustomerAndAirline < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :last_notification_id, :integer
    add_column :refinery_airlines, :last_notification_id, :integer

    add_column :refinery_customers, :views_count, :integer, :default => 0
    add_column :refinery_airlines, :views_count, :integer, :default => 0
  end
end
