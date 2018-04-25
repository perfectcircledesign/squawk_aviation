class AddSaleryStringToRefineryJobs < ActiveRecord::Migration
  def change
    remove_column :refinery_jobs, :salary
    add_column :refinery_jobs, :salary, :string
  end
end
