class AddTokenToCreditCards < ActiveRecord::Migration
  def change
    add_column :credit_cards, :token, :string
  end
end
