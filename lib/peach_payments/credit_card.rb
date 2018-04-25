module PeachPayments
	class CreditCard
		attr_accessor :params, :card_holder, :card_number, :expiry_month, :expiry_year, :security_code, :account_type, :last_4_digits, :registration_id

		def initialize(params)
		  @params = params
			@card_holder = params[:card_holder]
			@expiry_month = params[:expiry_month]
			@expiry_year = params[:expiry_year]
			@security_code = params[:cvv]
			@account_type = params[:brand]

		end

		def card_number
		  @card_number ||= params[:card_number].strip.gsub(' ', '')
		end

		def last_4_digits
		 @last_4_digits ||= params[:card_number].last(5)
		end
	end
end
