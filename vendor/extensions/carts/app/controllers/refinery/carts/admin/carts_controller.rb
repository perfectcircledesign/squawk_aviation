module Refinery
  module Carts
    module Admin
      class CartsController < ::Refinery::AdminController

        crudify :'refinery/carts/cart', :xhr_paging => true

      end
    end
  end
end
