class AddCoverLetterToRefineryCustomers < ActiveRecord::Migration
  def change
    add_column :refinery_customers, :cover_letter, :text
  end
end
