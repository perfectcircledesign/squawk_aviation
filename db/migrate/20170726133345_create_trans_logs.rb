class CreateTransLogs < ActiveRecord::Migration
  def change
    create_table :trans_logs do |t|
      t.string :request
      t.string :response
      t.integer :subscription_transaction_id

      t.timestamps
    end
  end
end
