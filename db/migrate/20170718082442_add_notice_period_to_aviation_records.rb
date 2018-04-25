class AddNoticePeriodToAviationRecords < ActiveRecord::Migration
  def change
    add_column :aviation_records, :notice_period, :string
  end
end
