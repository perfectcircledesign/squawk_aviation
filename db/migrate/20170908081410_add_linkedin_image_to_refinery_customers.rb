class AddLinkedinImageToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :linkedin_image_url, :string
  end
end
