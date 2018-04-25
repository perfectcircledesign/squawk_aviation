class AddUrlToRefineryArticles < ActiveRecord::Migration
  def change
    add_column :refinery_articles, :url, :string
  end
end
