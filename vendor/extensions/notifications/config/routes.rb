Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :notifications do
    resources :notifications, :path => '', :only => [:index, :show] do 
      member do 
        get :mark_seen
      end
    end 
  end

  match '/set_last_notification' => 'notifications/notifications#set_last_notification', :as => 'set_last_notification'

  # Admin routes
  namespace :notifications, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :notifications, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
