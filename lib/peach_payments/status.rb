module PeachPayments
	class Status
		attr_accessor :id

		def initialize(id)
		  @id = id
      @url = ENV['PEACH_PAYMENT_URI']
			@user_id =	ENV['PEACH_PAYMENT_USERID']
			@password = ENV['PEACH_PAYMENT_PASSWORD']
			@entity_id = ENV['PEACH_PAYMENT_ENTITYID']
		end

		def card_number
		  @card_number ||= params[:card_number].strip.gsub(' ', '')
		end
	end
end


		def status(id)
			resourcePath = url + "payments/#{id}"
			request(resourcePath, authentication_headers)
		end