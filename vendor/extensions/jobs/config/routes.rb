Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :jobs do
    resources :jobs, :path => ''
  end

  # get '/search' => 'jobs/jobs#search', :as => 'jobs_search'

  match '/favourite_job' => 'jobs/jobs#favourite_job', :as => 'favourite_job'

  # Admin routes
  namespace :jobs, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :jobs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
