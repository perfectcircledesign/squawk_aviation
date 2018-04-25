Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :employers do
    resources :employers, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :employers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :employers, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
