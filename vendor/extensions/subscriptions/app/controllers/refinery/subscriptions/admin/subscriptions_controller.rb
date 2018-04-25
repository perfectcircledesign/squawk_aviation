module Refinery
  module Subscriptions
    module Admin
      class SubscriptionsController < ::Refinery::AdminController

        crudify :'refinery/subscriptions/subscription',
                :title_attribute => 'plan_name', :xhr_paging => true

      end
    end
  end
end
