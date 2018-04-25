module Refinery
  module Notifications
    module Admin
      class NotificationsController < ::Refinery::AdminController

        crudify :'refinery/notifications/notification',
                :title_attribute => 'notification_type', :xhr_paging => true

      end
    end
  end
end
