module PeachPayments
	class Overlord

		require 'net/https'
		require 'uri'
		require 'json'

		attr_accessor :url, :user_id, :password, :entity_id, :card, :amount, :return_url, :customer, :return_url, :plan_id

		def initialize
		  @url = URI(ENV['PEACH_PAYMENT_URI'])
			@user_id =	ENV['PEACH_PAYMENT_USERID']
			@password = ENV['PEACH_PAYMENT_PASSWORD']
			@entity_id = ENV['PEACH_PAYMENT_ENTITYID']
			@return_url = ENV['PEACH_PAYMENT_RETURN_URI']
		end

		def preauthorize(card, amount, customer, plan_id)

			@amount = sprintf "%.2f", amount
			@card = card
			@customer = customer
			@return_url = return_url
			@plan_id = plan_id
			resourcePath = url + "payments"    
			message = build_preauthorize_message
      result = PreauthorizationResult.new(post(message, resourcePath))
      # log(transaction, message, result)
      result
		end

		def pay_and_clear(card, amount, customer, plan_id)
			@amount = sprintf "%.2f", amount
			@card = card
			@customer = customer
			@return_url = return_url
			@plan_id = plan_id
			resourcePath = url + "payments"
			message = build_pay_and_clear_message
			result = PreauthorizationResult.new(post(message, resourcePath))
			# log(transaction, message, result)
			result
		end


    def preauthorization_status(id)
    	resourcePath = url + "payments/#{id}"
    	message = authentication_params.to_query
    	result = PreauthorizationStatusResult.new(get(message, resourcePath))
    	# log(transaction, message, result)
    	result
    end

    private 

    def log(transaction, message, result)
      message = remove_sensitive_info(message)
      transaction.log_gateway_message(message.inspect, result.inspect)
    end

    def remove_sensitive_info(message)
      message['card.number'] = "*** REMOVED ***" unless message.is_a? String
      message
    end

    def build_preauthorize_message
			{
				'amount' => amount,
				'currency' => 'ZAR',
				'paymentType' => 'PA',
				'shopperResultUrl' => return_url,
				'createRegistration' => true,
				'card.number' => card.card_number,
				'card.holder' => card.card_holder,
				'card.expiryMonth' => card.expiry_month,
				'card.expiryYear' => card.expiry_year,
				'card.cvv' => card.security_code,
			  'customer.givenName' => customer.first_name,
        'customer.surname' => customer.surname,
        'customer.email' => customer.email,
        'customer.merchantCustomerId' => customer.id,
        'customParameters[plan_id]' => plan_id,
        'customParameters[card_type]' => card.account_type,
        'merchantTransactionId' => customer.id.to_s + 'PA' + DateTime.now.to_s
			}.merge(authentication_params)
		end

		def build_pay_and_clear_message
			{
					'amount' => amount,
					'currency' => 'ZAR',
					'paymentType' => 'DB',
					'shopperResultUrl' => return_url,
					'createRegistration' => true,
					'card.number' => card.card_number,
					'card.holder' => card.card_holder,
					'card.expiryMonth' => card.expiry_month,
					'card.expiryYear' => card.expiry_year,
					'card.cvv' => card.security_code,
					'customer.givenName' => customer.first_name,
					'customer.surname' => customer.surname,
					'customer.email' => customer.email,
					'customer.merchantCustomerId' => customer.id,
					'customParameters[plan_id]' => plan_id,
					'customParameters[card_type]' => card.account_type,
					'merchantTransactionId' => customer.id.to_s + 'DB' + DateTime.now.to_s
			}.merge(authentication_params)
		end

		def build_capture_token_message
			{				
				'card.number' => card.card_number,
				'card.expiryMonth' => card.expiry_month,
				'card.expiryYear' => card.expiry_year,
				'card.cvv' => card.security_code,
				'card.holder' => card.card_holder,
				'customer.givenName' => customer.first_name,
        'customer.surname' => customer.surname,
        'customer.email' => customer.email,				
        'merchantTransactionId' => customer.id.to_s + 'RG' + DateTime.now.to_s
			}.merge(authentication_params)
		end

		
		def authentication_params
			return {'authentication.userId' => user_id, 'authentication.password' => password, 'authentication.entityId' => entity_id}
		end

		def post(message, url)
			uri = URI(url)
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			req = Net::HTTP::Post.new(uri.path)			
			req.set_form_data(message)
			res = http.request(req)
			return JSON.parse(res.body)
		end

		def get(message, url)			
			uri = URI.parse(URI.encode((url.to_s + "?#{message}").strip))
			http = Net::HTTP.new(uri.host, uri.port)
			http.use_ssl = true
			res = http.get(uri.request_uri)
			return JSON.parse(res.body)
		end

		
	end
end
