class AddAirlineIdToRefineryJobs < ActiveRecord::Migration
  def change
    add_column :refinery_jobs, :airline_id, :integer
  end
end
