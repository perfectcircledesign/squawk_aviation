module Refinery
  module Customers
    class CustomersController < ::ApplicationController


      before_filter :find_page

      skip_before_filter :check_customer, :only => [:sign_in_customer]

      layout :determine_user_layout

      before_filter :airline_account, :except => [:sign_in_customer]

      def sign_in_customer
        customer = Refinery::Customers::Customer.find_by_email(params[:email])
        if customer.present?
          if customer.valid_password?(params[:password])
            sign_in(:customer, customer)
            if current_customer.free_user
              redirect_to '/wizard'
            elsif customer.career_path.present? and (customer.subscription.present? or (customer.trial? and customer.trial_vaild?))
              redirect_to '/news_feed'
            elsif (customer.trial? and !customer.trial_vaild?) and customer.subscription.nil? and !current_customer.free_user
              redirect_to '/subscriptions/new'
            else
               redirect_to '/wizard'
            end
          else
            flash[:error] = "Email or password is invalid"
            redirect_to '/'
          end
        else
          flash[:error] = "Email or password is invalid"
          redirect_to '/'
        end
      end

      def airline_account
        unless airline_signed_in?
          redirect_to '/airlines/sign_in'
        else
          @airline = current_airline
        end
      end


      def index

        if params[:job_id].present?
          @customers = Refinery::Customers::Customer.eager_load(:favourites).where('favourites.job_id = ? AND favourites.customer_id = refinery_customers.id', params[:job_id])
        else
          @customers = Refinery::Customers::Customer.order('position ASC')
        end

        # puts @customers.map{|t| t.complete_percentage}

        if params[:career_path].present?
          @customers = @customers.where(:career_path => params[:career_path])
        end

        if params[:general].present?
          @customers = @customers.where("UPPER(first_name) LIKE '%#{params[:general].upcase}%' or UPPER(surname) LIKE '%#{params[:general].upcase}%' or UPPER(cover_letter) LIKE '%#{params[:general].upcase}%'")
        end

        if params[:languages].present?
          @customers = @customers.joins(:languages).where('refinery_languages.id IN (?)', params[:languages])
        end

        if params[:customer].present? and params[:customer][:nationality].present?
          @customers = @customers.where(:nationality => params[:customer][:nationality])
          # @customers = @customers.where(:dual_nationality_details => params[:customer][:nationality])
        end

        if params[:age_range].present?
          age = params[:age_range].split(";")
          @customers = @customers.where("age BETWEEN #{age.first} AND #{age.last}")
        end

        if params[:flying_hours_range].present?
          hours = params[:flying_hours_range].split(";")
          if hours.first.to_i == 0
            @customers.where("total_flying_time = 0 or total_flying_time IS null")
          else
            @customers = @customers.where("total_flying_time BETWEEN #{hours.first.to_i} AND #{hours.last.to_i}")
          end
        end

        # if params[:licence_type].present?
        #   @all_customers = []
        #   @customers.each do |customer|
        #     if customer.maintenance_certifications.present?
        #       customer.maintenance_certifications.each do |item|
        #         if item.license_type == params[:licence_type]
        #           @all_customers << customer
        #         end
        #       end
        #     end
        #   end
        #   @customers = @all_customers.uniq
        # end



        # if params[:aircraft_type].present?
        #   @all_customers = []
        #   @customers.each do |customer|
        #     if customer.flying_hours.present?
        #       customer.flying_hours.each do |hour|
        #         if hour.airplane_id == params[:aircraft_type]
        #           @all_customers << customer
        #         end
        #       end
        #     end
        #   end
        #   @customers = @all_customers.uniq
        # end

        if params[:p1].present? and params[:p1].to_i  != 0
          @customers = @customers.where("p1 >= ?", params[:p1])
        end
        if params[:p2].present? and params[:p2].to_i  != 0
          @customers = @customers.where("p2 >= ?", params[:p2])
        end
        if params[:p3].present? and params[:p3].to_i  != 0
          # if params[:p3].to_i  == 0
          #   @customers = @customers.where("p3 = ? or p3 IS null", params[:p3].to_i)
          # else
          @customers = @customers.where("p3 >= ?", params[:p3])
          # end
        end

        if params[:show_blacklist].blank?
          @all_cust = []
          @customers.each do |customer|
            blacklist = BlacklistCustomer.where('customer_id = ? AND airline_id = ?', customer.id, current_airline.id).first
            unless blacklist.present?
              @all_cust << customer
            end
          end
          @customers = @all_cust.uniq
        end

        @customers = @customers.sort_by{ |c| c.complete_percentage.to_i}.reverse.uniq

        @show_nav = true
        present(@page)
      end

      def search

        present(@page)
      end
      def request_profile
        
      end

      def print_cv
        if params[:customer_id].present?
          @customer = Customer.find(params[:customer_id])
        else
          render index
        end
      end

      def show
        @customer_detail = Refinery::Subscriptions::Subscription.where(customer_id:params[:id])
        @show_nav = true
        @stylesheet = 'user-profile'
        @customer = Customer.find(params[:id])
        unless @customer.views_count.present?
          @customer.views_count = 0
        end
        @customer.views_count = @customer.views_count + 1
        @customer.save!

        if Refinery::Notifications::Notification.valid?(Refinery::Notifications::Notification::AIRLINE_VIEW, current_airline.id, current_airline.class.name, @customer.id, @customer.class.name)
          Refinery::Notifications::Notification.create!(notification_type: Refinery::Notifications::Notification::AIRLINE_VIEW, url: "/airlines/#{current_airline.id}", sender_id: current_airline.id, sender_class: current_airline.class.name, receiver_id: @customer.id, receiver_class:  @customer.class.name)
        end

        # respond_to do |format|
        #   format.html
        #   format.pdf do
        #     render pdf: "print_cv"   # Excluding ".pdf" extension.
        #   end
        # end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @lodge in the line below:
        present(@page)
      end

      def favourite_customer
        if current_airline.present? and params[:customer_id].present?
          favourite = Favourite.where("customer_id = ? AND airline_id = ? AND who_favourite = ?",  params[:customer_id], current_airline.id, 'Airline').first
          if favourite.present?
            favourite.destroy
          else
            if Refinery::Notifications::Notification.valid?(Refinery::Notifications::Notification::AIRLINE_LIKE, current_airline.id, current_airline.class.name, params[:customer_id], 'Refinery::Customers::Customer')
              Refinery::Notifications::Notification.create!(notification_type: Refinery::Notifications::Notification::AIRLINE_LIKE, url: "/airlines/#{current_airline.id}", sender_id: current_airline.id, sender_class: current_airline.class.name, receiver_id: params[:customer_id], receiver_class:  'Refinery::Customers::Customer')
            end
            Favourite.create(:airline_id => current_airline.id, :customer_id => params[:customer_id], :who_favourite => 'Airline')
          end
        end
      end

    protected

      def determine_user_layout
        if current_airline.present? and action_name == 'print_cv'
          'print_layout'
        elsif current_airline.present?
          'full'
        end
      end


      def find_page
        @page = Refinery::Page.find_by_link_url('/customers', :include => [:parts])
      end

    end
  end
end
