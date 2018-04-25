Refinery::Core::Engine.routes.append do

  devise_for :airlines, :class_name => 'Refinery::Airlines::Airline',
             :controllers => { :sessions => "airlines/sessions", :passwords => "airlines/passwords",
                               :registrations => "airlines/registrations" }

  # Frontend routes
  namespace :airlines do
    resources :airlines, :path => '', :only => [:index, :show]
  end

  match '/favourite_airline' => 'airlines/airlines#favourite_airline', :as => 'favourite_airline'

  # Admin routes
  namespace :airlines, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :airlines, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
