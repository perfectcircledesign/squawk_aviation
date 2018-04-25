module Refinery
  module Invoices
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Invoices

      engine_name :refinery_invoices

      initializer "register refinerycms_invoices plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "invoices"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.invoices_admin_invoices_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/invoices/invoice',
            :title => 'invoice_number'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Invoices)
      end
    end
  end
end
