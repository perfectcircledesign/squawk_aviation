class CreateSubscriptionTransactions < ActiveRecord::Migration
  def change
    create_table :subscription_transactions do |t|
      t.integer :customer_id
      t.integer :subscription_id
      t.integer :credit_card_id
      t.string :amount
      t.string :notes
      t.string :transaction_status

      t.timestamps
    end
  end
end
