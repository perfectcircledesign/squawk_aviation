class AddPhoneExtentionToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :phone_extension1, :string
    add_column :refinery_customers, :phone_extension2, :string
  end
end
