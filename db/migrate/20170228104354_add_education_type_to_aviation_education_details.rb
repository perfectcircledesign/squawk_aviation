class AddEducationTypeToAviationEducationDetails < ActiveRecord::Migration
  def change
    add_column :aviation_education_details, :education_type, :string
  end
end
