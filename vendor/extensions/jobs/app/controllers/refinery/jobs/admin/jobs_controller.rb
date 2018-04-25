module Refinery
  module Jobs
    module Admin
      class JobsController < ::Refinery::AdminController

        crudify :'refinery/jobs/job',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
