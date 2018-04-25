# This migration comes from refinery_carts (originally 2)
class CreateLineItemsLineItems < ActiveRecord::Migration

  def up
    create_table :refinery_line_items do |t|
      t.integer :cart_id, :allow_nil => false
      t.integer :product_id
      t.integer :quantity, :allow_nil => false, :default => 1
      t.integer :position

      t.timestamps
    end

  end

  def down
    #if defined?(::Refinery::UserPlugin)
    #  ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-line_items"})
    #end
    #
    #if defined?(::Refinery::Page)
    #  ::Refinery::Page.delete_all({:link_url => "/line_items/line_items"})
    #end

    drop_table :refinery_line_items

  end

end
