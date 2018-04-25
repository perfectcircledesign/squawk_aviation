class AddCareerPathToRefineryJobs < ActiveRecord::Migration
  def change
    add_column :refinery_jobs, :career_path, :string
  end
end
