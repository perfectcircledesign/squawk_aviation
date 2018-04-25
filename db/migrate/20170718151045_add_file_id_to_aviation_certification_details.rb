class AddFileIdToAviationCertificationDetails < ActiveRecord::Migration
  def change
    add_column :aviation_certification_details, :file_id, :integer
  end
end
