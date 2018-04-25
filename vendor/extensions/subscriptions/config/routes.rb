Refinery::Core::Engine.routes.append do

  
  # Frontend routes
  namespace :subscriptions do
    resources :subscriptions, :path => '', :except => :show do
      collection do 
        get :trial
      end
    end
  end

  # Admin routes
  namespace :subscriptions, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :subscriptions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
