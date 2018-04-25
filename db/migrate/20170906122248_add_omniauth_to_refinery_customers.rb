class AddOmniauthToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :provider, :string
    add_column :refinery_customers, :uid, :string
  end
end
