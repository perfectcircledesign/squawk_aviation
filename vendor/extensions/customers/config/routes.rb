Refinery::Core::Engine.routes.append do

  devise_for :customers, :class_name => 'Refinery::Customers::Customer',
             :controllers => { :sessions => "customers/sessions", :passwords => "customers/passwords",
                               :registrations => "customers/registrations", :omniauth_callbacks => "customers/omniauth_callbacks", :confirmations => "customers/confirmations" }


  get '/customers_search' => 'customers/customers#search', :as => 'customers_search'
  post '/sign_in_customer' => 'customers/customers#sign_in_customer', :as => 'sign_in_customer'

  match '/refinery/customers/customer_list' => 'customers/admin/customers#customer_list', :as => 'admin_customer_list'

  get '/imitate_customer' => 'customers/admin/customers#imitate_customer', :as => 'imitate_customer'

  match '/favourite_customer' => 'customers/customers#favourite_customer', :as => 'favourite_customer'

  match '/print_cv' => 'customers/customers#print_cv', :as => 'print_cv'

  match '/print_pdf_cv' => 'customers/customers#print_pdf_cv', :as => 'print_pdf_cv'



  # Admin routes
  namespace :customers, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :customers, :except => [:show] do
        collection do
          post :update_positions
        end
      end
    end
  end

  # Frontend routes
  namespace :customers do
    resources :customers, :path => '', :only => [:index, :show]
  end


end
