# This migration comes from refinery_invoices (originally 1)
class CreateInvoicesInvoices < ActiveRecord::Migration

  def up
    create_table :refinery_invoices do |t|
      t.string :invoice_number
      t.string :trans_number
      t.string :sub_type
      t.string :start_date
      t.string :end_date
      t.string :price_dollar
      t.string :price_rand
      t.string :card_last_digits
      t.integer :customer_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-invoices"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/invoices/invoices"})
    end

    drop_table :refinery_invoices

  end

end
