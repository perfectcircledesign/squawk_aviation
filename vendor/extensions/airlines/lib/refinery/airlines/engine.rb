module Refinery
  module Airlines
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Airlines

      engine_name :refinery_airlines

      initializer "register refinerycms_airlines plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "airlines"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.airlines_admin_airlines_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/airlines/airline',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Airlines)
      end
    end
  end
end
