class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ::Devise::AfterSignInFix

  def facebook
    @customer = Refinery::Customers::Customer.from_omniauth(request.env["omniauth.auth"])


    if @customer.persisted?
      sign_in @customer
      # set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
       redirect_to '/news_feed'
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to refinery.root_path
    end
  end

   def linkedin
    @customer = Refinery::Customers::Customer.from_omniauth(request.env["omniauth.auth"])

    if @customer.persisted?
      sign_in @customer
      # set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
       redirect_to '/news_feed'
    else
      session["devise.linkedin_data"] = request.env["omniauth.auth"]
      redirect_to refinery.root_path
    end
  end

  def failure
    redirect_to refinery.root_path
  end
end