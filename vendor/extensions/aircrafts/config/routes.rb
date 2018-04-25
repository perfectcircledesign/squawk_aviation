Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :aircrafts do
    resources :aircrafts, :path => '', :only => [:index, :show]
  end

  # match '/refinery/aircrafts/aircraft_list' => 'admin/back_links#back_links_list', :as => 'admin_aircraft_list'
  match '/refinery/aircrafts/import' => 'aircrafts/admin/aircrafts#import', :as => 'admin_import'
  match '/refinery/aircrafts/new_aircraft_import' => 'aircrafts/admin/aircrafts#new_aircraft_import', :as => 'new_aircraft_import'


  # Admin routes
  namespace :aircrafts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :aircrafts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
