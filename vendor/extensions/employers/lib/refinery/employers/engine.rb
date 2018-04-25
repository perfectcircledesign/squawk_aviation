module Refinery
  module Employers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Employers

      engine_name :refinery_employers

      initializer "register refinerycms_employers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "employers"
          plugin.hide_from_menu = true
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.employers_admin_employers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/employers/employer',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Employers)
      end
    end
  end
end
