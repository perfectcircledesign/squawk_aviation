class AddExtraFieldsToAviationCertificationDetails < ActiveRecord::Migration
  def change
    add_column :aviation_certification_details, :license_authority, :string
  end
end
