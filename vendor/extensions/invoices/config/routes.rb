Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :invoices do
    resources :invoices, :path => ''
  end

  # Admin routes
  namespace :invoices, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :invoices, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
