Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :route_experiences do
    resources :route_experiences, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :route_experiences, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :route_experiences, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
