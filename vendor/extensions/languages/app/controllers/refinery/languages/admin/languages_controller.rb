module Refinery
  module Languages
    module Admin
      class LanguagesController < ::Refinery::AdminController

        crudify :'refinery/languages/language',
                :title_attribute => 'name', :xhr_paging => true, :paging => false

      end
    end
  end
end
