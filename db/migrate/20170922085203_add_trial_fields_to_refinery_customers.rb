class AddTrialFieldsToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :trial_start_at, :date
    add_column :refinery_customers, :trial_end_at, :date
  end
end
