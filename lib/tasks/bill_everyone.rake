namespace :bill_everyone do
  task :submit_payments => :environment do
    require 'net/https'
    require 'uri'
    require 'json'
    require 'ostruct'
    require 'eu_central_bank'

    # :amount, :credit_card_id, :customer_id, :notes, :subscription_id, :transaction_status
    # SubscriptionTransaction

    # :request, :response, :subscription_transaction_id
    # TransLog


      eu_bank = EuCentralBank.new
      Money.default_bank = eu_bank

      # call this before calculating exchange rates
      # this will download the rates from ECB
      eu_bank.update_rates

      # using the new exchange_with method

   Refinery::Subscriptions::Subscription.new_billing.each do |sub|
     puts sub.inspect
     puts sub.credit_card.token
     puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'

     fail_count = sub.fail_payment_count.present? ? sub.fail_payment_count : 0
     if fail_count < 3 and sub.customer.present?

       trans = SubscriptionTransaction.new
       trans.subscription_id = sub.id

       if sub.credit_card.present? and sub.credit_card.token.present?

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
         puts result.result.description
         puts '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'


         it = result.result.code =~ /^(000\.000\.|000\.100\.1|000\.[36])/ ? true :false
         if it
           TransLog.create(:request => request, :response => JSON.parse(res.body), :subscription_transaction_id => trans.id)
           puts 'success'
           trans.transaction_status = 'Success'
           sub.fail_payment_count = 0
           sub.exp_date = sub.exp_date + sub.plan.duration.to_i.months
           sub.suspend = false
           sub.save!
           InvoiceCreation.create_invoice(sub, result.merchantTransactionId, cost)
         else
           TransLog.create(:request => request, :response => JSON.parse(res.body), :subscription_transaction_id => trans.id)
           puts 'Failed'
           sub.fail_payment_count += 1
           sub.save!
           trans.transaction_status = 'Failed'
           if sub.fail_payment_count >= 3
            sub.suspend = true
            sub.save!
            Notifier.account_suspend(sub.customer, result.result.description).deliver
            Notifier.client_account_suspend(sub.customer, result.result.description).deliver
           else
            Notifier.payment_failed(sub.customer, result.result.description).deliver
            Notifier.client_payment_failed(sub.customer, result.result.description).deliver
           end
         end
         trans.save!
         # TransLog.create(:request => request, :response => JSON.parse(res.body), :subscription_transaction_id => trans.id)
       end
     else

     end
   end


  end

end


class InvoiceCreation
  def self.create_invoice(sub, trans_no, cost)
    if sub.plan.duration.to_i == 1
      duration = 'Squawk Monthly'
    else
      duration = 'Squawk Annually'
    end

    invoice = Refinery::Invoices::Invoice.create(:trans_number => trans_no.to_s, :sub_type => duration, :start_date => DateTime.now.strftime('%D').to_s,
                                                 :end_date => sub.exp_date.strftime('%D').to_s, :price_dollar => sub.plan.cost.to_s, :price_rand => cost.to_s, :card_last_digits => sub.credit_card.last_digits.to_s,
                                                 :customer_id => sub.customer.id)
    Notifier.mail_invoice(invoice).deliver
  end

end
