class CreditCardsController < ::ApplicationController
  require 'credit_card_validations/string'
  before_filter :authenticate_customer!
  skip_before_filter :check_customer

  def new

  end

  def create
    if current_customer.subscription.present?
      if CreditCardValidations::Luhn.valid?(params[:credit_card][:card_number].gsub(' ', ''))
        card = ::PeachPayments::CreditCard.new(credit_card_params)  
        peachPayment = PeachPayments::Overlord.new
        if params[:payment_type].present?
          require 'eu_central_bank'
          eu_bank = EuCentralBank.new
          Money.default_bank = eu_bank
          eu_bank.update_rates
          cost = sprintf "%.2f", eu_bank.exchange_with(Money.new(current_customer.subscription.plan.cost, "USD"), "ZAR").cents
          @capture_result = peachPayment.pay_and_clear(card, cost, current_customer, current_customer.subscription.plan.id)
          if !@capture_result.redirect?
            flash[:notice] = @capture_result.description
            redirect_to '/payments'
          end
        else
          @capture_result = peachPayment.preauthorize(card, 1, current_customer, current_customer.subscription.plan.id)
          if !@capture_result.redirect?
            flash[:notice] = @capture_result.description
            redirect_to '/payments'
          end
        end
      else
        flash[:error] = "CreditCard info was incorrect, please try again"
        redirect_to '/payments'
      end
    else
      flash[:error] = "No subscription plan selected"
      redirect_to '/subscriptions/new'
    end

  end

  def edit

  end

  def update
    @credit_card = CreditCard.find(params[:id])
    if @credit_card.update_attributes(params[:credit_card])
      redirect_to '/account'
    end
  end

  def destroy
    item = CreditCard.find(params[:id])
    item.destroy
    # flash[:notice] = 'File Successfully Deleted'
    redirect_to '/account'
  end


  private




  def credit_card_params
    cc = {}
    cc[:card_number] = params[:credit_card][:card_number]
    cc[:expiry_month] = params[:credit_card][:exp_month]
    if params[:credit_card][:exp_year].length == 2
      cc[:expiry_year] = '20' + params[:credit_card][:exp_year]
    else
      cc[:expiry_year] = params[:credit_card][:exp_year]
    end
    cc[:cvv] = params[:credit_card][:bin]
    cc[:card_holder] = params[:credit_card][:holder]
    cc[:brand] = params[:credit_card][:card_number].credit_card_brand_name.upcase
    return cc
  end

end

