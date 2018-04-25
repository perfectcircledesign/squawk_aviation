module Refinery
  module Employers
    module Admin
      class EmployersController < ::Refinery::AdminController

        crudify :'refinery/employers/employer',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
