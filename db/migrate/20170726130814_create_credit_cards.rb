class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.integer :customer_id
      t.string :bin
      t.string :last_digits
      t.string :holder
      t.string :exp_month
      t.string :exp_year
      t.string :brand

      t.timestamps
    end
  end
end
