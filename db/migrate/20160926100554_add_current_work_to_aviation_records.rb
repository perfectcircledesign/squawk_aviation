class AddCurrentWorkToAviationRecords < ActiveRecord::Migration
  def change
    add_column :aviation_records, :current_work, :boolean, :default => false
  end
end
