module Refinery
  module Aircrafts
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Aircrafts

      engine_name :refinery_aircrafts

      initializer "register refinerycms_aircrafts plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "aircrafts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.aircrafts_admin_aircrafts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/aircrafts/aircraft',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Aircrafts)
      end
    end
  end
end
