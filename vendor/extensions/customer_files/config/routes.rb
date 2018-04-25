Refinery::Core::Engine.routes.append do
  match '/system/customer_files/*dragonfly', :to => Dragonfly[:refinery_customer_files]
  # Frontend routes
  namespace :customer_files do
    resources :customer_files, :path => '', :only => [:index, :show, :destroy, :create, :new]
  end
  post '/customer_files/user_send_file' => 'customer_files/customer_files#customer_send_file', :as => 'customer_send_file'

  # Admin routes
  namespace :customer_files, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :customer_files, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
