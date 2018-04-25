module Refinery
  module LineItems
    module Admin
      class LineItemsController < ::Refinery::AdminController

        crudify :'refinery/line_items/line_item', :xhr_paging => true

      end
    end
  end
end
