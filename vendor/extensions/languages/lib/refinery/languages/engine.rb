module Refinery
  module Languages
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Languages

      engine_name :refinery_languages

      initializer "register refinerycms_languages plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "languages"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.languages_admin_languages_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/languages/language',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Languages)
      end
    end
  end
end
