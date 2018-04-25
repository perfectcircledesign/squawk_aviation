module Refinery
  module CustomerFiles
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::CustomerFiles

      engine_name :refinery_customer_files

      config.autoload_paths += %W( #{config.root}/lib )

      initializer 'attach-refinery-resources-with-dragonfly', :after => :load_config_initializers do |app|
        ::Refinery::CustomerFiles::Dragonfly.configure!
        ::Refinery::CustomerFiles::Dragonfly.attach!(app)
      end

      initializer "register refinerycms_customer_files plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "customer_files"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.customer_files_admin_customer_files_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/customer_files/customer_file',
            :title => 'file_mime_type'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CustomerFiles)
      end
    end
  end
end
