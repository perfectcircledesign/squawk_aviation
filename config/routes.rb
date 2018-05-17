Jetcrew360::Application.routes.draw do

  authenticate :refinery_user do
    match '/admin' => 'admin#dashboard'


    namespace :admin do
      resources :customers, :only => [:index, :show]
      resources :airlines, :only => [:index, :show]
      resources :jobs, :only => [:index, :show]
    end

  end

  devise_scope :customer do
    match 'account' => 'customers/registrations#account', :as => 'account'
    match 'payperview_subs' => 'refinery/subscriptions/subscriptions#payperview_subs', :as => 'payperview_subs'
    match 'wizard' => 'customers/registrations#wizard', :as => 'wizard'
    match 'payments' => 'customers/registrations#payments', :as => 'payments'
    match 'invoice_show' => 'customers/registrations#invoice_show', :as => 'invoice_show'
    match 'status' => 'customers/registrations#status', :as => 'status'
    match 'retry_payment' => 'customers/registrations#retry_payment', :as => 'retry_payment'
    match '/news_feed' => 'customers/registrations#news_feed', :as => 'news_feed'
    match '/jobs_feed' => 'customers/registrations#jobs_feed', :as => 'jobs_feed'
    match '/search' => 'customers/registrations#search', :as => 'search'
    get 'load_new_form' => 'customers/registrations#load_new_form', as: :load_new_form
    #match 'request_profile' => "refinery/customers/customers#request_profile", :as => 'request_profile'
    post 'request_profile' => 'refinery/customers/customers#request_profile', :as => 'request_profile'
    # get '/customers/auth/facebook', to: "customers/omniauth_callbacks#facebook", as: :customer_facebook_omniauth_authorize
    # get '/customers/auth/linkedin', to: "customers/omniauth_callbacks#linkedin", as: :customer_linkedin_omniauth_authorize
  end


  devise_scope :airline do
    match 'airline_account' => 'airlines/registrations#airline_account', :as => 'airline_account'
    match 'pilot_search' => 'airlines/registrations#pilot_search', :as => 'pilot_search'
    match 'airline_profile' => 'airlines/registrations#airline_profile', :as => 'airline_profile'
    match 'airline_jobs' => 'airlines/registrations#airline_jobs', :as => 'airline_jobs'
    match 'airline_posts' => 'airlines/registrations#airline_posts', :as => 'airline_posts'
  end

  match '/blacklist' => 'blacklist_customers#blacklist', :as => 'blacklist'

  namespace :api do
    namespace :v1 do
      namespace :refinery, path: '' do
        get 'news_feed/customer/:customer_id' => 'news_feeds#customer', :as => 'customer_news_feed'
        resources :articles, only: [:index, :show]
        get 'options/:customer_id' => 'options#index'
        resources :airlines do
          member do
            get 'customer/:customer_id' => 'airlines#show'
          end
          collection do 
            get 'customer/:customer_id' => 'airlines#index'
          end
          post 'customer/:customer_id/favourite' => 'airlines#favourite'
        end
        resources :jobs, only: [:index] do
          post 'customer/:customer_id/favourite' => 'jobs#favourite'
          member do
            get 'customer/:customer_id' => 'jobs#show'
          end
          collection do         
            get 'customer/:customer_id' => 'jobs#index'
          end
        end
        resources :customers, only: [:show, :update] do 
          member do
            post :search
          end
          resources :educations, only: [:create, :update, :index]
          resources :certifications, only: [:create, :update, :index]
          resources :employment_histories, only: [:create, :update, :index]
          resources :hours, only: [:create, :update, :index]
          resources :route_experiences, only: [:create, :update, :index]
          resources :logbooks, only: [:create, :update, :index]
          resources :notifications, only: [:index] do
            collection do
              get 'count'
            end
          end
          resources :messages, only: [:index, :show] do
            collection do
              post '/airline/:airline_id' => 'messages#create'
            end
          end
        end

        # devise_for :customers, :class_name => 'Refinery::Customers::Customer', :token_authentication => 'authentication_key'

      end
    end
  end

  resource :flying_hours

  resource :flying_hours_cabins

  resource :aviation_records

  resource :route_experiences

  resource :cabin_certifications

  resource :maintenance_certifications

  resource :aviation_certification_details

  resource :aviation_education_details

  resource :credit_cards

  resource :maintenance_hours


  # This line mounts Refinery's routes at the root of your application.
  # This means, any requests to the root URL of your application will go to Refinery::PagesController#home.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Refinery relies on it being the default of "refinery"
  mount Refinery::Core::Engine, :at => '/'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
