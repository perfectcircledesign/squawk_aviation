class AddDeliveryOptionFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :refinery_orders, :delivery_option_name, :string
    add_column :refinery_orders, :delivery_cost, :decimal, :scale => 2, :precision => 10
    add_column :refinery_orders, :delivery_waybill_number, :string
  end
end
