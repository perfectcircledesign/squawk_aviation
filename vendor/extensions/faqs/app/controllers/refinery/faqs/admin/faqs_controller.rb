module Refinery
  module Faqs
    module Admin
      class FaqsController < ::Refinery::AdminController

        crudify :'refinery/faqs/faq', :xhr_paging => true

      end
    end
  end
end
