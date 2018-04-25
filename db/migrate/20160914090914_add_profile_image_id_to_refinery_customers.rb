class AddProfileImageIdToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :profile_image_id, :integer
  end
end
