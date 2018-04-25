module Refinery
  module Articles
    module Admin
      class ArticlesController < ::Refinery::AdminController

        crudify :'refinery/articles/article',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
