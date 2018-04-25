module PeachPayments
	class PreauthorizationResult
		
		attr_accessor :response

    def initialize(response)
      @response = response 
    end

    def id
    	response['id']
    end

    def redirect?
    	response['redirect'].present?
    end

    def successfull?
      response['result']['code'] =~ /^(000\.000\.|000\.100\.1|000\.[36])/ ? true :false
    end

    def pending?      
      response['result']['code'] =~ /^(000\.200)/ ? true :false  
    end

    def code
    	response['result']['code']
    end

    def description
    	response['result']['description']
    end

    def redirect_url
    	response['redirect']['url']
    end

    def redirect_parameters
    	response['redirect']['parameters']
    end

    def card
    	response['card']
    end

    def registration_id
        response['registrationId']
    end

    def risk_score
    	response['risk']['score']
    end

	end
end