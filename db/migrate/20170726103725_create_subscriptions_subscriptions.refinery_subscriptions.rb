# This migration comes from refinery_subscriptions (originally 1)
class CreateSubscriptionsSubscriptions < ActiveRecord::Migration

  def up
    create_table :refinery_subscriptions do |t|
      t.integer :customer_id
      t.string :plan_name
      t.integer :plan_duration
      t.float :plan_cost
      t.date :exp_date
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-subscriptions"})
    end

    drop_table :refinery_subscriptions

  end

end
