class AddFacebookFieldsToRefineryCustomer < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :facebook_image_url, :string
    add_column :refinery_customers, :small_facebook_image_url, :string
  end
end
