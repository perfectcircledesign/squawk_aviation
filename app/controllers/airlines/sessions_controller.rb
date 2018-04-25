class Airlines::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource_or_scope)
    # refinery.customers_search_path
    "/airline_account"
  end

end