class AddSuspendToRefinerySubscriptions < ActiveRecord::Migration
  def change
    add_column :refinery_subscriptions, :suspend, :boolean, :default => false
  end
end
