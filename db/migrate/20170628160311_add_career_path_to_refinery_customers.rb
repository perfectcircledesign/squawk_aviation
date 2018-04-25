class AddCareerPathToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :career_path, :string
  end
end
