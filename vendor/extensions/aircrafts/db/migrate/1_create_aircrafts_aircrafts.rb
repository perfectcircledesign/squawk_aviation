class CreateAircraftsAircrafts < ActiveRecord::Migration

  def up
    create_table :refinery_aircrafts do |t|
      t.string :name
      t.string :weight
      t.string :engine
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-aircrafts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/aircrafts/aircrafts"})
    end

    drop_table :refinery_aircrafts

  end

end
