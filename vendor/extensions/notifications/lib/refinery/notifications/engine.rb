module Refinery
  module Notifications
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Notifications

      engine_name :refinery_notifications

      initializer "register refinerycms_notifications plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "notifications"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.notifications_admin_notifications_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/notifications/notification',
            :title => 'notification_type'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Notifications)
      end
    end
  end
end
