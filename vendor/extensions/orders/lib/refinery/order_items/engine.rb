module Refinery
  module OrderItems
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::OrderItems

      engine_name :refinery_orders

      #initializer "register refinerycms_order_items plugin" do
      #  Refinery::Plugin.register do |plugin|
      #    plugin.name = "order_items"
      #    plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.order_items_admin_order_items_path }
      #    plugin.pathname = root
      #    plugin.activity = {
      #      :class_name => :'refinery/order_items/order_item',
      #      :title => 'product_name'
      #    }
      #
      #  end
      #end

      config.after_initialize do
        Refinery.register_extension(Refinery::OrderItems)
      end
    end
  end
end
