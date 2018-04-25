# This migration comes from refinery_customers (originally 1)
class CreateCustomersCustomers < ActiveRecord::Migration

  def up
    create_table :refinery_customers do |t|
      t.string :first_name
      t.string :surname
      t.string :contact_number
      t.string :fax_number
      t.boolean :is_company, :default => true, :allow_nil => false
      t.string :company_name
      t.string :company_registration_number
      t.string :company_vat_number
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

      ## Encryptable
      # t.string :password_salt

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token

      t.timestamps
    end

    add_index :refinery_customers, :email,                :unique => true
    add_index :refinery_customers, :reset_password_token, :unique => true
    # add_index :customers, :confirmation_token,   :unique => true
    # add_index :customers, :unlock_token,         :unique => true
    # add_index :customers, :authentication_token, :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-customers"})
    end

    #if defined?(::Refinery::Page)
    #  ::Refinery::Page.delete_all({:link_url => "/customers/customers"})
    #end

    drop_table :refinery_customers

  end

end
