class CreateRefineryCustomersLanguages < ActiveRecord::Migration
  def up
    create_table :refinery_customers_languages, :id => false do |t|
      t.integer :customer_id
      t.integer :language_id
    end

    add_index :refinery_customers_languages, :customer_id
    add_index :refinery_customers_languages, :language_id

  end

  def down
    drop_table :refinery_customers_languages
  end
end
