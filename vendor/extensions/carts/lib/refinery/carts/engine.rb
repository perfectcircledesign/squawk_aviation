module Refinery
  module Carts
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Carts

      engine_name :refinery_carts

      initializer "register refinerycms_carts plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "carts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.carts_admin_carts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/carts/cart'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Carts)
      end
    end
  end
end
