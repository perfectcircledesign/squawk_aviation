Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :orders do
    match "submit_to_tracker" => "orders#submit_to_tracker", :as => 'submit_to_tracker'
    match "find_coupon" => "orders#find_coupon", :as => 'find_coupon'
    match "remove_coupon" => "orders#remove_coupon", :as => 'remove_coupon'
    resources :orders, :path => '' do
      match "print_invoice" => "orders#print_invoice", :as => 'print_invoice'
      match "submit_to_gateway" => "orders#submit_to_gateway", :as => 'submit_to_gateway'
      match "success" => "orders#success", :as => 'success'
      match "payment_response" => "orders#payment_response", :as => 'payment_response'
      match "payment_successful" => "orders#payment_successful", :as => 'payment_successful'
      match "payment_fail" => "orders#payment_fail", :as => 'payment_fail'
      match "payment_try_later" => "orders#payment_try_later", :as => 'payment_try_later'
      match "payment_error" => "orders#payment_error", :as => 'payment_error'
    end
  end

  # Admin routes
  namespace :orders, :path => '' do
    namespace :admin, :path => 'refinery' do
      match "orders/picking_report" => "orders#picking_report", :as => "picking_report"
      match "orders/labelling_report" => "orders#labelling_report", :as => "labelling_report"
      match "orders/invoicing_report" => "orders#invoicing_report", :as => "invoicing_report"
      match "orders/mark_all_as_processing" => "orders#mark_all_as_processing", :as => "mark_all_as_processing"
      resources :orders do
        match "print_invoice" => "orders#print_invoice", :as => 'print_invoice'
        match "print_waybill" => "orders#print_waybill", :as => 'print_waybill'
        match "update_awaiting_eft" => "orders#update_awaiting_eft", :as => "update_awaiting_eft"
        match "update_awaiting_cc" => "orders#update_awaiting_cc", :as => "update_awaiting_cc"
        match "update_new" => "orders#update_new", :as => "update_new"
        match "update_processing" => "orders#update_processing", :as => "update_processing"
        match "update_complete" => "orders#update_complete", :as => "update_complete"
        match "update_cancelled" => "orders#update_cancelled", :as => "update_cancelled"
        match "update_stale" => "orders#update_stale", :as => "update_stale"
        collection do
          match 'export' => 'orders#export', :as => 'export'
          get :notification_recipients
          post :notification_recipients

          post :update_positions

        end
      end

      #resources :orders, :except => :show do
      #  collection do
      #    post :update_positions
      #  end
      #end
    end
  end


  # Frontend routes
  namespace :transactions do
    resources :transactions, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :transactions, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :transactions, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
