module Refinery
  module RouteExperiences
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::RouteExperiences

      engine_name :refinery_route_experiences

      initializer "register refinerycms_route_experiences plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "route_experiences"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.route_experiences_admin_route_experiences_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/route_experiences/route_experience',
            :title => 'continent'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::RouteExperiences)
      end
    end
  end
end
