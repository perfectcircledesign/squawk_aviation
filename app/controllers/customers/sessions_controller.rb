class Customers::SessionsController < Devise::SessionsController
  include ::Devise::AfterSignInFix
  respond_to :js

  skip_before_filter :check_customer, :only => [:destroy]

  # GET /resource/sign_in
  def new
    resource = build_resource
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
      resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
  end


  # def create
  #
  #   resource = warden.authenticate!(auth_options)
  #   set_flash_message(:notice, :signed_in) if is_navigational_format?
  #   sign_in(resource_name, resource)
  #
  #   #respond_with resource, :location => after_sign_in_path_for(resource)
  #   if resource.present?
  #     render 'login'
  #   end
  #   render :js => "window.location = '/account'"
  # end
  #
  # respond_to do |format|
  #   format.js  { render 'login' }
  # end

end