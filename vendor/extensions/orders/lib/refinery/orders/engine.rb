module Refinery
  module Orders
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Orders

      engine_name :refinery_orders

      initializer "register refinerycms_orders plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "orders"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.orders_admin_orders_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/orders/order',
            :title => 'order_number'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Orders)
      end
    end
  end
end
