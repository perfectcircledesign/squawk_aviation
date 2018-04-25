Refinery::Core::Engine.routes.append do

  # Frontend routes
  match 'cart' => 'carts/carts#show', :as => 'cart', :via => [:get]
  match 'carts/add_to_cart/:id' => 'carts/carts#add_to_cart', :as => 'add_to_cart', :via => [:get, :post]
  match 'line_items/destroy/:id' => 'line_items/line_items#destroy', :as => 'destroy_line_item', :via => [:get]

  # Admin routes
  namespace :carts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :carts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
