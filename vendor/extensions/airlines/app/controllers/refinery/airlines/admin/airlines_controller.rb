module Refinery
  module Airlines
    module Admin
      class AirlinesController < ::Refinery::AdminController

        crudify :'refinery/airlines/airline',
                :title_attribute => 'name', :xhr_paging => true

        before_filter :sanitize_params, :only => [:update]

        def sanitize_params
          if params[:airline][:password].blank? and params[:airline][:password_confirmation].blank?
            params[:airline].delete(:password)
            params[:airline].delete(:password_confirmation)
          end
        end

      end
    end
  end
end
