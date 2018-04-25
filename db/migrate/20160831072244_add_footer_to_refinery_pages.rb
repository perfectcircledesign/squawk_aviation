class AddFooterToRefineryPages < ActiveRecord::Migration
  def change
    add_column :refinery_pages, :footer, :boolean, :default => false
  end
end
