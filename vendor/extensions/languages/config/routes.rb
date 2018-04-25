Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :languages do
    resources :languages, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :languages, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :languages, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
