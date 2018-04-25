# This migration comes from refinery_jobs (originally 1)
class CreateJobsJobs < ActiveRecord::Migration

  def up
    create_table :refinery_jobs do |t|
      t.string :name
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-jobs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/jobs/jobs"})
    end

    drop_table :refinery_jobs

  end

end
