# app/controllers/api/base_controller.rb
class Api::V1::BaseController < ActionController::Base
  include ActionController::ImplicitRender
  respond_to :json

  # before_filter :authenticate_customer_from_token!
  after_filter :allow_cross_domain_access
  skip_before_filter :verify_authenticity_token


  # protected

  def current_customer
    if token_from_request.blank?
      nil
    else
      authenticate_customer_from_token!
    end
  end
  alias_method :devise_current_customer, :current_customer

  def customer_signed_in?
    !current_customer.nil?
  end
  alias_method :devise_customer_signed_in?, :customer_signed_in?

  def authenticate_customer_from_token!
    if claims and customer = Refinery::Customers::Customer.find_by_id(claims[0]['customer'])
    @customer = customer
    else
      return render_unauthorized
    end
  end

  def claims
    JWT.decode(token_from_request, "YOURSECRETKEY", true)
  rescue
    nil
  end

  def jwt_token customer
    # 2 Weeks
    expires = Time.now.to_i + (3600 * 24 * 14)
    JWT.encode({:customer => customer.id, :exp => expires}, "YOURSECRETKEY", 'HS256')
  end

  def render_unauthorized(payload = { errors: { unauthorized: ["You are not authorized perform this action."] } })
    render json: payload.merge(response: { code: 401 }), status: 401
  end

  def token_from_request
    # Accepts the token either from the header or a query var
    # Header authorization must be in the following format
    # Authorization: Bearer {yourtokenhere}
    auth_header = request.headers['Authorization'] and token = auth_header.split(' ').last
    if(token.to_s.empty?)
      token = request.parameters["token"]
    end

    token
  end

  def allow_cross_domain_access
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(',')
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Max-Age'] = '1728000'
  end

end
