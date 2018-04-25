module Refinery
  module Messages
    module Admin
      class MessagesController < ::Refinery::AdminController

        crudify :'refinery/messages/message',
                :title_attribute => 'sender', :xhr_paging => true, :order => 'created_at'

      end
    end
  end
end
