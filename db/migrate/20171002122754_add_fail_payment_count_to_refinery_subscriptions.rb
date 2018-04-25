class AddFailPaymentCountToRefinerySubscriptions < ActiveRecord::Migration
  def change
    add_column :refinery_subscriptions, :fail_payment_count, :integer
  end
end
