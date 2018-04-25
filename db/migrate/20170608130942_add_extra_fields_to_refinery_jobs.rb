class AddExtraFieldsToRefineryJobs < ActiveRecord::Migration
  def change
    add_column :refinery_jobs, :benefits, :text
    add_column :refinery_jobs, :requirements, :text
    add_column :refinery_jobs, :active, :boolean
    add_column :refinery_jobs, :location, :string
    add_column :refinery_jobs, :salary, :float
  end
end
