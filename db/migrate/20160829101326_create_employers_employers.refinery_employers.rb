# This migration comes from refinery_employers (originally 1)
class CreateEmployersEmployers < ActiveRecord::Migration

  def up
    create_table :refinery_employers do |t|
      t.string :name
      t.integer :image_id
      t.string :url
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-employers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/employers/employers"})
    end

    drop_table :refinery_employers

  end

end
