class CreateOrderItemsOrderItems < ActiveRecord::Migration

  def up
    create_table :refinery_order_items do |t|
      t.string :product_name
      t.string :product_stock_code
      t.string :product_supplier_stock_code
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :order_id
      t.integer :quantity
      t.decimal :total, :precision => 10, :scale => 2
      t.integer :position

      t.timestamps
    end

  end

  def down
    #if defined?(::Refinery::UserPlugin)
    #  ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-order_items"})
    #end
    #
    #if defined?(::Refinery::Page)
    #  ::Refinery::Page.delete_all({:link_url => "/order_items/order_items"})
    #end

    drop_table :refinery_order_items

  end

end
