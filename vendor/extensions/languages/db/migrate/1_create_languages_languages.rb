class CreateLanguagesLanguages < ActiveRecord::Migration

  def up
    create_table :refinery_languages do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-languages"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/languages/languages"})
    end

    drop_table :refinery_languages

  end

end
