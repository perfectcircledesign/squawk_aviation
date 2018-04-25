module Refinery
  module RouteExperiences
    module Admin
      class RouteExperiencesController < ::Refinery::AdminController

        crudify :'refinery/route_experiences/route_experience',
                :title_attribute => 'continent', :xhr_paging => true, :paging => false

      end
    end
  end
end
