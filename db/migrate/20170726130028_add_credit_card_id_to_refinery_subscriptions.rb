class AddCreditCardIdToRefinerySubscriptions < ActiveRecord::Migration
  def change
    add_column :refinery_subscriptions, :credit_card_id, :integer
  end
end
