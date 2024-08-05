class Customers::RegistrationsController < Devise::RegistrationsController
  include ::Devise::AfterSignInFix

  before_filter :authenticate_customer!
  before_filter :find_page
  skip_before_filter :check_customer, :only => [:wizard, :account, :update, :create, :new, :edit, :status, :payments, :load_new_form, :retry_payment]

  def wizard
    if !current_customer.free_user
      current_customer.update_attribute(:free_user, true)
    end
    # if current_customer.trial? and !current_customer.trial_vaild?
    #   return redirect_to '/subscriptions/new'
    # elsif !current_customer.trial? and current_customer.subscription.nil?
    #   return redirect_to '/subscriptions/new'
    # end
    if current_customer.career_path.present? and current_customer.free_user
      return redirect_to '/news_feed'
    elsif current_customer.subscription.nil? and !current_customer.free_user
      return redirect_to '/subscriptions/new'
    end
  end

  def payments
    @show_nav = true
  end

  def status
    @show_nav = true
    if params[:id].present?
      peachPayment = PeachPayments::Overlord.new
      result = peachPayment.preauthorization_status(params[:id])
      if result.successfull? and Refinery::Customers::Customer.find_by_email(result.customer['email']) == current_customer
        if result.payment_type == 'DB'

          if current_customer.subscription.present?
            if current_customer.subscription.fail_payment_count >= 3
              current_card = current_customer.subscription.credit_card
              current_card.destroy if current_card.present?
              card = CreditCard.create!(holder: result.card['holder'], brand: result.card_type, customer_id: current_customer.id, exp_month: result.card['expiryMonth'], exp_year: result.card['expiryYear'], last_digits: result.card['last4Digits'], token: result.token)
              current_customer.subscription.update_attributes(credit_card_id: card.id)
            end
            flash[:notice] = "Card change and payment successful"
          else
            card = CreditCard.create!(holder: result.card['holder'], brand: result.card_type, customer_id: current_customer.id, exp_month: result.card['expiryMonth'], exp_year: result.card['expiryYear'], last_digits: result.card['last4Digits'], token: result.token)
            current_customer.subscription = Refinery::Subscriptions::Subscription.create!(customer_id: current_customer.id, exp_date: 0.days.from_now, plan_id: result.plan_id, credit_card_id: card.id)
          end

          sub = current_customer.subscription
          trans = SubscriptionTransaction.new
          trans.subscription_id = sub.id

          puts 'success'
          trans.transaction_status = 'Success'
          sub.fail_payment_count = 0
          sub.exp_date = sub.exp_date + sub.plan.duration.to_i.months
          sub.suspend = false
          sub.save!
          trans.save!

          number = "Squawk00" + sub.id.to_s
          if sub.plan.duration.to_i == 1
            duration = 'Squawk Monthly'
          else
            duration = 'Squawk Annually'
          end

          require 'eu_central_bank'

          eu_bank = EuCentralBank.new
          Money.default_bank = eu_bank

          eu_bank.update_rates
          cost = sprintf "%.2f", eu_bank.exchange_with(Money.new(sub.plan.cost, "USD"), "ZAR").cents

          invoice = Refinery::Invoices::Invoice.create(:invoice_number => number.to_s, :trans_number => result.merchant_id.to_s, :sub_type => duration, :start_date => DateTime.now.strftime('%D').to_s,
                                                       :end_date => sub.exp_date.strftime('%D').to_s, :price_dollar => sub.plan.cost.to_s, :price_rand => cost.to_s, :card_last_digits => sub.credit_card.last_digits.to_s,
                                                       :customer_id => sub.customer.id)
          Notifier.mail_invoice(invoice).deliver
          redirect_to '/payments'
        else
          if current_customer.subscription.present?
            current_card = current_customer.subscription.credit_card
            current_card.destroy if current_card.present?
            card = CreditCard.create!(holder: result.card['holder'], brand: result.card_type, customer_id: current_customer.id, exp_month: result.card['expiryMonth'], exp_year: result.card['expiryYear'], last_digits: result.card['last4Digits'], token: result.token)
            current_customer.subscription.update_attributes(credit_card_id: card.id)
          else
            card = CreditCard.create!(holder: result.card['holder'], brand: result.card_type, customer_id: current_customer.id, exp_month: result.card['expiryMonth'], exp_year: result.card['expiryYear'], last_digits: result.card['last4Digits'], token: result.token)
            Refinery::Subscriptions::Subscription.create!(customer_id: current_customer.id, exp_date: 90.days.from_now, plan_id: result.plan_id, credit_card_id: card.id)
          end
          flash[:notice] = result.description
          redirect_to '/payments'
        end
      else
        flash[:error] = result.description
        # current_customer.subscription.credit_card.destroy if current_customer.subscription.present? and current_customer.subscription.credit_card.present?
      end

    end
  end

  def new_card

  end

  def invoice_show
    if params[:id].present?
      @invoice = Refinery::Invoices::Invoice.find_by_id(params[:id])
    else
      redirect_to '/payments'
    end
  end

  def retry_payment

    require 'net/https'
    require 'uri'
    require 'json'
    require 'ostruct'
    require 'eu_central_bank'

    eu_bank = EuCentralBank.new
    Money.default_bank = eu_bank

    eu_bank.update_rates
    sub = Refinery::Subscriptions::Subscription.find_by_id(current_customer.subscription.id)

    trans = SubscriptionTransaction.new
    trans.subscription_id = sub.id

    if sub.credit_card.token.present?
      cost = sprintf "%.2f", eu_bank.exchange_with(Money.new(sub.plan.cost, "USD"), "ZAR").cents

      request = {
          'authentication.userId' => '8acda4cc5e3cb4fd015e709414a05458',
          'authentication.password' => 'KREYtb5kWd',
          'authentication.entityId' => '8acda4cc5e3cb4fd015e70964c58546d',
          'amount' => cost,
          'currency' => 'ZAR',
          'paymentType' => 'DB',
          'recurringType' => 'REPEATED',
          'customer.givenName' => sub.customer.first_name,
          'customer.surname' => sub.customer.surname,
          'customer.email' => sub.customer.email,
          'merchantTransactionId' => sub.customer.id.to_s + 'DB' + DateTime.now.to_s
      }
      uri = URI("https://test.oppwa.com/v1/registrations/#{sub.credit_card.token}/payments")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Post.new(uri.path)
      req.set_form_data(request)
      res = http.request(req)
      result = RStruct.new(JSON.parse(res.body))

      it = result.result.code =~ /^(000\.000\.|000\.100\.1|000\.[36])/ ? true :false
      if it
        TransLog.create(:request => request, :response => JSON.parse(res.body), :subscription_transaction_id => trans.id)
        puts 'success'
        trans.transaction_status = 'Success'
        sub.fail_payment_count = 0
        sub.exp_date = sub.exp_date + sub.plan.duration.to_i.months
        sub.suspend = false
        sub.save!
        trans.save!

        # number = "Squawk00" + sub.id.to_s
        if sub.plan.duration.to_i == 1
          duration = 'Squawk Monthly'
        else
          duration = 'Squawk Annually'
        end

        invoice = Refinery::Invoices::Invoice.create(:trans_number => result.merchantTransactionId.to_s, :sub_type => duration, :start_date => DateTime.now.strftime('%D').to_s,
                                                     :end_date => sub.exp_date.strftime('%D').to_s, :price_dollar => sub.plan.cost.to_s, :price_rand => cost.to_s, :card_last_digits => sub.credit_card.last_digits.to_s,
                                                     :customer_id => sub.customer.id)
        Notifier.mail_invoice(invoice).deliver
        flash[:notice] = "Payment Successful"
        redirect_to '/payments'
      else
        puts 'Failed'
        trans.transaction_status = 'Failed'
        Notifier.payment_failed(sub.customer, result.result.description).deliver
        Notifier.client_payment_failed(sub.customer, result.result.description).deliver
        trans.save!
        flash[:error] = "Payment Failed"
        redirect_to '/payments'
      end
      TransLog.create(:request => request, :response => JSON.parse(res.body), :subscription_transaction_id => trans.id)
    end

  end



  def account
      @show_nav = true
      @customer = Refinery::Customers::Customer.find(current_customer.id)
      @subscriptions_deail = Refinery::Subscriptions::Subscription.where(customer_id:current_customer.id)
      #@subscriptions_deail = Refinery::Subscriptions::Subscription.find(3)

      #Rails.logger.debug "Customer deatils #{@subscriptions_deail}"
      #abort
      @favourite_airlines = Refinery::Airlines::Airline.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id', 'pilot', @customer.id)
      @favourite_jobs = Refinery::Jobs::Job.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.job_id = refinery_jobs.id', 'pilot', @customer.id)
  end

  def news_feed
      @stylesheet = "user-profile"
      @show_nav = true
      
      @customer = Refinery::Customers::Customer.find(current_customer.id)
      @jobs = Refinery::Jobs::Job.order('created_at DESC').is_active.first(3)
      @all_items = ArticleJobLookup.joins(airline: :favourites).includes(:job).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id AND ((refinery_jobs.active = ? AND published_date <= ? AND expiry_date >= ?)  OR article_job_lookups.job_id IS null) ', 'pilot', @customer.id, true, DateTime.now, DateTime.now).order('article_job_lookups.created_at DESC')
      # @all_items = ArticleJobLookup.joins(airline: :favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id', 'pilot', @customer.id).order('created_at DESC')
      @favourite_airlines = Refinery::Airlines::Airline.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id', 'pilot', @customer.id)
      @favourite_jobs = Refinery::Jobs::Job.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.job_id = refinery_jobs.id', 'pilot', @customer.id)
      ids_to_exclude = @favourite_airlines.map{ |t| t.id}
      @not_favourite_airlines = Refinery::Airlines::Airline.where('id NOT IN (?)', ids_to_exclude )
      # @jobs = Refinery::Jobs::Job.joins(airline: :favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id', 'pilot', @customer.id).order('created_at ASC')
      # @articles = Refinery::Articles::Article.joins(airline: :favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id', 'pilot', @customer.id).order('created_at ASC')
  end

  def jobs_feed
      @show_nav = true
      @customer = Refinery::Customers::Customer.find(current_customer.id)
      if params[:jobs_search].present?
        @jobs = Refinery::Jobs::Job.is_active.where("UPPER(description) LIKE '%#{params[:jobs_search].upcase}%' or UPPER(name) LIKE '%#{params[:jobs_search].upcase}%'").order('created_at DESC')
      else
        @jobs = Refinery::Jobs::Job.is_active.order('created_at DESC')
      end

      if params[:job].present?
        if params[:job][:location].present?
          @jobs = @jobs.where(:location => params[:job][:location])
        end
        if params[:job][:career_path].present?
          @jobs = @jobs.where(:career_path => params[:job][:career_path])
        end
        if params[:job][:contract_type].present?
          @jobs = @jobs.where(:contract_type => params[:job][:contract_type])
        end
      end

  end

  # def messaging
  #   @customer = Refinery::Customers::Customer.find(current_customer.id)
  #
  # end

  def search
    @show_nav = true
    @customer = Refinery::Customers::Customer.find(current_customer.id)
    if params[:search].present?
      @search_jobs = Refinery::Jobs::Job.is_active.where("UPPER(description) LIKE '%#{params[:search].upcase}%' or UPPER(name) LIKE '%#{params[:search].upcase}%'")
      @search_articles = Refinery::Articles::Article.where("UPPER(body) LIKE '%#{params[:search].upcase}%' or UPPER(name) LIKE '%#{params[:search].upcase}%'")
    end
  end

  def load_new_form
    if params[:type] == "flying_hours"
      if params[:id].present?
        @flying_hour = FlyingHour.find(params[:id])
      else
        @flying_hour = FlyingHour.new
      end
    elsif params[:type] == "flying_hours_cabins"
      if params[:id].present?
        @flying_hours_cabin = FlyingHoursCabin.find(params[:id])
      else
        @flying_hours_cabin = FlyingHoursCabin.new
      end
    elsif params[:type] == "aviation_record"
      if params[:id].present?
        @aviation_record = AviationRecord.find(params[:id])
      else
        @aviation_record = AviationRecord.new
      end
    elsif params[:type] == "credit_card"
      if params[:id].present?
        @credit_card = CreditCard.find(params[:id])
      else
        @credit_card = CreditCard.new
      end
    elsif params[:type] == "aviation_certification"
      if params[:id].present?
        @aviation_certification = AviationCertificationDetail.find(params[:id])
      else
        @aviation_certification = AviationCertificationDetail.new
      end
    elsif params[:type] == "cabin_certification"
      if params[:id].present?
        @cabin_certification = CabinCertification.find(params[:id])
      else
        @cabin_certification = CabinCertification.new
      end
    elsif params[:type] == "maintenance_certification"
      if params[:id].present?
        @maintenance_certification = MaintenanceCertification.find(params[:id])
      else
        @maintenance_certification = MaintenanceCertification.new
      end
    elsif params[:type] == "maintenance_hour"
      if params[:id].present?
        @maintenance_hour = MaintenanceHour.find(params[:id])
      else
        @maintenance_hour = MaintenanceHour.new
      end
    elsif params[:type] == "aviation_education"
      if params[:id].present?
        @aviation_education = AviationEducationDetail.find(params[:id])
      else
        @aviation_education = AviationEducationDetail.new
      end
    end
  end

  # POST /resource
  # def create
  #   build_resource
  #   if resource.save
  #     if resource.active_for_authentication?
  #       set_flash_message :notice, :signed_up if is_navigational_format?
  #       sign_in(resource_name, resource)
  #
  #       # if resource.respond_to?(:register_for_wholesale)
  #       #   if resource.register_for_wholesale
  #       #     users = Refinery::User.all
  #       #     users.each do |user|
  #       #       Notifier.request_for_wholesale(user, resource).deliver
  #       #     end
  #       #   end
  #       # end
  #
  #       respond_with resource, :location => after_sign_up_path_for(resource)
  #     else
  #       set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
  #       expire_session_data_after_sign_in!
  #       respond_with resource, :location => after_inactive_sign_up_path_for(resource)
  #     end
  #   else
  #     clean_up_passwords resource
  #     respond_with resource
  #   end
  # end

  def create
    build_resource


    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        # return render :json => {:success => true}
        render :js => "window.location = '/wizard'"
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        # return render :json => {:success => true}
        render :js => "$('#register_form').modal('hide');$('#thank_you').modal('show');"
      end
    else
      clean_up_passwords resource
      respond_to do |format|
        format.js  { render 'create' }
      end
    end
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    respond_to do |format|
      format.html{
        if resource.update_without_password(params[resource_name])
          if is_navigational_format?
            if resource.respond_to?(:pending_reconfirmation?) && resource.pending_reconfirmation?
              flash_key = :update_needs_confirmation
            end
            set_flash_message :notice, flash_key || :updated
          end
          sign_in resource_name, resource, :bypass => true
          respond_with resource, :location => after_update_path_for(resource)
        else
          clean_up_passwords resource
          respond_with resource
        end

        if resource.errors.empty?
          if params[:customer][:image_upload].present?
            require 'ostruct'
            his_image = RStruct.new(eval(params[:customer][:image_upload].first.gsub(':','=>').gsub('null','nil')))
            #raise
            if his_image.present? and his_image.output.type.include? "image"
              image = Refinery::Image.create(:image => Base64.decode64(his_image.output.image['data=>image/png;base64,'.length .. -1]))
              @customer.profile_image_id = image.id
              @customer.save!
            end
          end
        end

        if @customer.date_of_birth.present?
          now = Time.now.utc.to_date
          @customer.age = now.year - @customer.date_of_birth.year - (@customer.date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
          @customer.save!
        end
      }
      format.js{
      if resource.valid_password?(params[:old_password])
       resource.password = params[resource_name][:password]
       resource.password_confirmation = params[resource_name][:password_confirmation]
       if resource.save
         sign_in resource_name, resource, :bypass => true
       end
      else
        @old_password = true
      end
      }
    end

  end



  def find_page
    @page = ::Refinery::Page.where(:link_url => "/news_feed").first
  end

  def after_update_path_for(resource)
    if params[:customer].present?
      if params[:customer][:cover_letter].present?
        "/account#letter"
      elsif params[:customer][:route_experience_ids].present?
        "/account#route_tag"
      else
        "/account"
      end
    else
      "/account"
    end
  end


end