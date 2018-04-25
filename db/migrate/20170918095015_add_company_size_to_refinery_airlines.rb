class AddCompanySizeToRefineryAirlines < ActiveRecord::Migration
  def change
    add_column :refinery_airlines, :company_size, :string
    add_column :refinery_airlines, :image1_id, :integer
    add_column :refinery_airlines, :image2_id, :integer
    add_column :refinery_airlines, :image3_id, :integer
    add_column :refinery_airlines, :image4_id, :integer
    add_column :refinery_airlines, :image5_id, :integer
    add_column :refinery_airlines, :sliver_id, :integer
  end
end
