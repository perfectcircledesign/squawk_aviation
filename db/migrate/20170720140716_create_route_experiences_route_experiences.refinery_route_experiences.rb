# This migration comes from refinery_route_experiences (originally 1)
class CreateRouteExperiencesRouteExperiences < ActiveRecord::Migration

  def up
    create_table :refinery_route_experiences do |t|
      t.string :continent
      t.string :airport
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-route_experiences"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/route_experiences/route_experiences"})
    end

    drop_table :refinery_route_experiences

  end

end
