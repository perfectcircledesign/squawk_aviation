# This migration comes from refinery_customer_files (originally 1)
class CreateCustomerFilesCustomerFiles < ActiveRecord::Migration

  def up
    create_table :refinery_customer_files do |t|
      t.string :file_mime_type
      t.string :file_name
      t.integer :file_size
      t.string :file_uid
      t.string :file_ext
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-customer_files"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/customer_files/customer_files"})
    end

    drop_table :refinery_customer_files

  end

end
