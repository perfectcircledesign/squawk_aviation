module Refinery
  module LineItems
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::LineItems

      engine_name :refinery_carts

      #initializer "register refinerycms_line_items plugin" do
      #  Refinery::Plugin.register do |plugin|
      #    plugin.name = "line_items"
      #    plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.line_items_admin_line_items_path }
      #    plugin.pathname = root
      #    plugin.activity = {
      #      :class_name => :'refinery/line_items/line_item'
      #    }
      #
      #  end
      #end

      config.after_initialize do
        Refinery.register_extension(Refinery::LineItems)
      end
    end
  end
end
