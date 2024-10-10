class AddEmailToReferences < ActiveRecord::Migration
  def change
    add_column :references, :email, :string
  end
end
