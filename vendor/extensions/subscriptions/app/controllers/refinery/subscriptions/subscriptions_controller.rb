module Refinery
  module Subscriptions
    class SubscriptionsController < ::ApplicationController
      require 'credit_card_validations/string'

      layout :determine_user_layout
      skip_before_filter :check_customer

      def trial
        current_customer.update_attributes!(trial_start_at: Date.today, trial_end_at: (Date.today + 14.days), agree_tc: true) unless current_customer.subscription.present? or current_customer.trial?
        redirect_to '/news_feed'
      end

      def new
        # if current_customer.subscription.present?
        #   redirect_to '/payments'
        # end
        @show_nav = true
        @credit_card = CreditCard.new

        present(@page)
      end

      def destroy
        item = Refinery::Subscriptions::Subscription.find(params[:id])
        cust = item.customer_id
        item.credit_card.destroy if item.credit_card.present?
        item.destroy
        if current_refinery_user.present?
          redirect_to '/admin/customers/' + cust.to_s
        else
          redirect_to '/subscriptions/new'
        end
      end

      def create

        if params[:plan_id].present?
          # send to get token
          plan = Refinery::Plans::Plan.find(params[:plan_id])
          require 'eu_central_bank'
          eu_bank = EuCentralBank.new
          Money.default_bank = eu_bank
          eu_bank.update_rates
          cost = sprintf "%.2f", eu_bank.exchange_with(Money.new(plan.cost, "USD"), "ZAR").cents

          if CreditCardValidations::Luhn.valid?(params[:credit_card][:card_number].gsub(' ', ''))
              card = ::PeachPayments::CreditCard.new(credit_card_params)   
              peachPayment = PeachPayments::Overlord.new
              @capture_result = peachPayment.pay_and_clear(card, cost, current_customer, params[:plan_id])
              if !@capture_result.redirect?
                flash[:notice] = @capture_result.description
                redirect_to '/status'
              end
          else
            flash[:error] = "CreditCard info was incorrect, please try again"
            redirect_to '/subscriptions/new'
          end
        else
          flash[:error] = "Please select a payment plan"
          redirect_to '/subscriptions/new'
        end

      end

      def determine_user_layout
        "full"
      end

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
  end
end
