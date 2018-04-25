class AddConfirmableToRefineryCustomers < ActiveRecord::Migration
 # Note: You can't use change, as User.update_all will fail in the down migration
  def up
    add_column :refinery_customers, :confirmation_token, :string
    add_column :refinery_customers, :confirmed_at, :datetime
    add_column :refinery_customers, :confirmation_sent_at, :datetime
    # add_column :refinery_customers, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :refinery_customers, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # refinery_customers as confirmed, do the following
    Refinery::Customers::Customer.update_all confirmed_at: DateTime.now
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_columns :refinery_customers, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :refinery_customers, :unconfirmed_email # Only if using reconfirmable
  end
end
