class AddDatesToRefineryJobs < ActiveRecord::Migration
  def change
    add_column :refinery_jobs, :published_date, :date
    add_column :refinery_jobs, :expiry_date, :date
  end
end
