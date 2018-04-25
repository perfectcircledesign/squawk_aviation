class AddPositionHeldToAviationRecords < ActiveRecord::Migration
  def change
    add_column :aviation_records, :position_held, :string
  end
end
