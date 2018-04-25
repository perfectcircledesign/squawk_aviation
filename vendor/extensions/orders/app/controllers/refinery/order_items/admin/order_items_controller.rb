module Refinery
  module OrderItems
    module Admin
      class OrderItemsController < ::Refinery::AdminController

        crudify :'refinery/order_items/order_item',
                :title_attribute => 'product_name', :xhr_paging => true

      end
    end
  end
end
