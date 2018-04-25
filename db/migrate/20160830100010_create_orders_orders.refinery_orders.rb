# This migration comes from refinery_orders (originally 1)
class CreateOrdersOrders < ActiveRecord::Migration

  def up
    create_table :refinery_orders do |t|
      t.string :order_number
      t.integer :customer_id
      t.string :order_status
      t.decimal :grand_total, :precision => 10, :scale => 2
      t.string :address_line_1
      t.string :address_line_2
      t.string :suburb
      t.string :city
      t.string :postal_code
      t.string :payment_type
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-orders"})
    end

    #if defined?(::Refinery::Page)
    #  ::Refinery::Page.delete_all({:link_url => "/orders/orders"})
    #end

    drop_table :refinery_orders

  end

end
