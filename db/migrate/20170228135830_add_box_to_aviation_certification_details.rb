class AddBoxToAviationCertificationDetails < ActiveRecord::Migration
  def change
    add_column :aviation_certification_details, :mcc, :boolean, :default => false
    add_column :aviation_certification_details, :dangerous_goods, :boolean, :default => false
    add_column :aviation_certification_details, :crm, :boolean, :default => false
    add_column :aviation_certification_details, :tcas_acas, :boolean, :default => false
    add_column :aviation_certification_details, :lvo, :boolean, :default => false
    add_column :aviation_certification_details, :rnav_gnss, :boolean, :default => false
    add_column :aviation_certification_details, :rvsm, :boolean, :default => false
    add_column :aviation_certification_details, :cfit_gpws, :boolean, :default => false
    add_column :aviation_certification_details, :etops, :boolean, :default => false
  end
end
