class Customers::PasswordsController < Devise::PasswordsController

  def create
    respond_to do |format|
      format.html{ super}
      format.js {
        # this block will executed from the gumtree & vendor flow
        self.resource = resource_class.send_reset_password_instructions(params[:customer])
        yield resource if block_given?
        if successfully_sent?(resource)
          # do nothing
        else
          @error_messages = resource.errors.full_messages
          puts @error_messages.inspect
        end
      }
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    resource.reset_password_token = params[:reset_password_token]
  end

  # PUT /resource/password
  def update
    self.resource = resource_class.reset_password_by_token(params[resource_name])

    if resource.errors.empty?
      flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      set_flash_message(:notice, flash_message) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
    else
      respond_with resource
    end
  end

end