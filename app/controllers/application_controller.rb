class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_current_users, :check_airline
  layout :determine_layout
  before_filter :determine_notification_count, :check_customer

  def determine_layout
      if home_page?
        "home"
      # elsif controller_name == 'customer' and action_name == 'print_cv'
      #   'print_layout'
      elsif controller_name == 'sessions' and action_name == 'new'
        "airline_login_layout"
      elsif controller_name == 'registrations' and (action_name == 'airline_account' or action_name == 'pilot_search' or action_name == 'airline_profile' or action_name == 'airline_posts' or action_name == 'airline_jobs' or action_name == 'airline_profile')
        "airline"
      elsif controller_name == 'registrations' and (action_name == 'account' or action_name == 'news_feed' or action_name == 'jobs_feed' or action_name == 'search')
        "account"
      elsif (controller_name == 'jobs' and action_name == 'show') or (controller_name == 'messages' and action_name == 'index')
        "account"
      elsif controller_name == 'customers' and action_name == 'show'
        "airline"
      elsif (controller_name == 'registrations' and action_name == 'wizard') or (controller_name == 'registrations' and action_name == 'invoice_show')
        "wizard_layout"
      elsif controller_name == 'registrations' and action_name == 'payments' or (controller_name == 'registrations' and action_name == 'status')
        "full"
      elsif controller_name == 'confirmations' and action_name == 'new'
        "full_price"
      elsif controller_name == 'plans'
        "full_price"
      else
        "application"
      end
  end

  def get_current_users
    @customer = current_customer if current_customer.present?
    @airline = current_airline if current_airline.present?
  end

  def check_airline
    if current_airline.present?
      unless current_airline.valid_airline
        sign_out current_airline
        redirect_to '/airlines/sign_in', alert: 'Your account has not yet been activated.'
      end
    end
  end

  def check_customer
    if current_customer.present?
      if (current_customer.trial? and !current_customer.trial_vaild?) and current_customer.subscription.nil? and !current_customer.free_user
        return redirect_to '/subscriptions/new'
      elsif !current_customer.trial? and current_customer.subscription.nil? and !current_customer.free_user
        return redirect_to '/subscriptions/new'
      elsif current_customer.subscription.present? and (current_customer.subscription.suspend or current_customer.subscription.exp_date < DateTime.now ) and !current_customer.free_user
        flash[:error] = 'Sorry, subscription has expired.'
        redirect_to '/payments'
      elsif !current_customer.career_path.present?
        return redirect_to '/wizard'
      end
    end
  end




  before_filter :initialize_cart

  def initialize_cart

    @current_cart = get_cart

    # Handle a cart that might have been deleted
    if @current_cart.nil?
      @current_cart = ::Refinery::Carts::Cart.create(:is_current => true)
      session[:cart_id] = @current_cart.id
    end
  end

  def determine_notification_count
    if current_airline.present?
      current_airline.notification_count!
    elsif current_customer.present?
      current_customer.notification_count!
    end
  end

  # Get the current customer's cart
  def get_cart
    if customer_signed_in?

      # do we need to merge the carts?
      if current_customer.current_cart.present? and session[:cart_id].present? and current_customer.current_cart.id != session[:cart_id]
        cart = merge_customer_cart_and_session_cart
        session[:cart_id] = cart.id
        return cart
      else
        if session[:cart_id].present?
          begin
            cart = ::Refinery::Carts::Cart.find(session[:cart_id])

            if cart.customer_id.blank?
              cart.customer_id = current_customer.id
              cart.is_current = true
              cart.save
            end
            return cart
          rescue
            session[:cart_id] = nil
          end
        else
          cart = ::Refinery::Carts::Cart.where(:is_current => true, :customer_id => current_customer.id).first
          if cart.blank?
            cart = ::Refinery::Carts::Cart.create(:is_current => true, :customer_id => current_customer.id)
          end

          session[:cart_id] = cart.id
          return cart
        end
      end
    else
      #raise
      if session[:cart_id].present?
        cart = ::Refinery::Carts::Cart.find_by_id(session[:cart_id])
        if cart.blank?
          cart = ::Refinery::Carts::Cart.create(:is_current => true)
          session[:cart_id] = cart.id
          return cart
        else
          cart.is_current = true
          cart.save
          return cart
        end
      else
        cart = ::Refinery::Carts::Cart.create(:is_current => true)
        session[:cart_id] = cart.id
        return cart
      end
    end
  end

  def merge_customer_cart_and_session_cart
    session_cart = ::Refinery::Carts::Cart.find(session[:cart_id])
    customer_cart = current_customer.current_cart

    customer_cart.merge_other_cart(session_cart)
    customer_cart
  end

  def current_user
    if current_customer.present?
      @current_user = current_customer
    elsif current_airline.present?
      @current_user = current_airline
    else
      @current_user = nil
    end
  end
  helper_method :current_user

end
