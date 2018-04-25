class AddFreeUserToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :free_user, :boolean, default: false
  end
end
