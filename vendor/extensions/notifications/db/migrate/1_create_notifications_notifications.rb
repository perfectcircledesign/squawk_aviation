class CreateNotificationsNotifications < ActiveRecord::Migration

  def up
    create_table :refinery_notifications do |t|
      t.string :notification_type
      t.string :url
      t.integer :receiver_id
      t.string :receiver_class
      t.integer :sender_id
      t.string :sender_class
      t.boolean :seen
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-notifications"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/notifications/notifications"})
    end

    drop_table :refinery_notifications

  end

end
