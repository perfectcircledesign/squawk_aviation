class AddDateOfBirthToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :date_of_birth, :date
  end
end
