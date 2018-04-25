# This migration comes from refinery_articles (originally 1)
class CreateArticlesArticles < ActiveRecord::Migration

  def up
    create_table :refinery_articles do |t|
      t.string :name
      t.text :body
      t.integer :image_id
      t.integer :airline_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-articles"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/articles/articles"})
    end

    drop_table :refinery_articles

  end

end
