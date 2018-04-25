module Refinery
  module Subscriptions
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Subscriptions

      engine_name :refinery_subscriptions

      initializer "register refinerycms_subscriptions plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "subscriptions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.subscriptions_admin_subscriptions_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/subscriptions/subscription',
            :title => 'plan_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Subscriptions)
      end
    end
  end
end
