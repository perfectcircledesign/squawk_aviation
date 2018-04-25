class AddPlanIdToRefinerySubscriptions < ActiveRecord::Migration
  def change
    remove_column :refinery_subscriptions, :plan_name
    remove_column :refinery_subscriptions, :plan_duration
    remove_column :refinery_subscriptions, :plan_cost
    add_column :refinery_subscriptions, :plan_id, :integer
  end
end
