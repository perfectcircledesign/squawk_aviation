class Customers::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    # resource.update_attributes(:confirmation_token => params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      flash[:error] = "It appears your authentication token has expired, is invalid, or your email has already been confirmed. please request a new token below or sign-in to continue."
      redirect_to "/customers/confirmation/new"
      # respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
    end
  end

  private
  def after_confirmation_path_for(resource_name, resource)
    "/wizard"
  end
end
