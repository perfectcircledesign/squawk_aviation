class ChangeTransLogItemsToText < ActiveRecord::Migration
  def change
    remove_column :trans_logs, :request
    remove_column :trans_logs, :response

    add_column :trans_logs, :request, :text
    add_column :trans_logs, :response, :text
  end
end
