class Api::V1::Refinery::SessionsController < Api::V1::BaseController
  respond_to :json
  skip_before_filter :authenticate_customer_from_token!
  before_filter :ensure_params_exist

  def create
    @customer = Refinery::Customers::Customer.find_for_database_authentication(email: params[:email])
    return invalid_login_attempt unless @customer
    return invalid_login_attempt unless @customer.valid_password?(params[:password])
    @auth_token = jwt_token(@customer)
  end

  private



  def ensure_params_exist
    if params[:email].blank? || params[:password].blank?
      return render_unauthorized errors: { unauthenticated: ["Incomplete credentials"] }
    end
  end

  def invalid_login_attempt
    render_unauthorized errors: { unauthenticated: ["Invalid credentials"] }
  end



end
