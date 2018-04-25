module Refinery
  module Banners
    module Admin
      class BannersController < ::Refinery::AdminController

        crudify :'refinery/banners/banner',
                :title_attribute => 'name', :xhr_paging => true, :paging => false

      end
    end
  end
end
