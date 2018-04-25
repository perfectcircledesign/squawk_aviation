# This migration comes from refinery_carts (originally 1)
class CreateCartsCarts < ActiveRecord::Migration

  def up
    create_table :refinery_carts do |t|
      t.integer :customer_id
      t.boolean :is_current
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-carts"})
    end

    #if defined?(::Refinery::Page)
    #  ::Refinery::Page.delete_all({:link_url => "/carts/carts"})
    #end

    drop_table :refinery_carts

  end

end
