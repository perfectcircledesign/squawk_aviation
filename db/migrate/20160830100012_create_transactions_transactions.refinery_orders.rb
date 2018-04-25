# This migration comes from refinery_orders (originally 3)
class CreateTransactionsTransactions < ActiveRecord::Migration

  def up
    create_table :refinery_transactions do |t|
      t.string :unique_guid, :nil => false
      t.integer :order_id, :nil => false
      t.decimal :amount, :precision => 10, :scale => 2, :nil => false
      t.boolean :is_payment_successful, :default => false, :nil => false
      t.text :notes
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-transactions"})
    end

    #if defined?(::Refinery::Page)
    #  ::Refinery::Page.delete_all({:link_url => "/transactions/transactions"})
    #end

    drop_table :refinery_transactions

  end

end
