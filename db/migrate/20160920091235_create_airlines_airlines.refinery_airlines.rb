# This migration comes from refinery_airlines (originally 1)
class CreateAirlinesAirlines < ActiveRecord::Migration

  def up
    create_table :refinery_airlines do |t|
      t.string :name
      t.string :contact_number
      t.integer :position

      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :refinery_airlines, :email,                :unique => true
    add_index :refinery_airlines, :reset_password_token, :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-airlines"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/airlines/airlines"})
    end

    drop_table :refinery_airlines

  end

end
