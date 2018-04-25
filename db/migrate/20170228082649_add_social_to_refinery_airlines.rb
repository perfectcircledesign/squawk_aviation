class AddSocialToRefineryAirlines < ActiveRecord::Migration
  def change
    add_column :refinery_airlines, :facebook, :string
    add_column :refinery_airlines, :twitter, :string
    add_column :refinery_airlines, :linkedin, :string
    add_column :refinery_airlines, :googleplus, :string
    add_column :refinery_airlines, :website, :string
  end
end
