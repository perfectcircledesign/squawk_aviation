module PeachPayments
	class PreauthorizationStatusResult
		
		attr_accessor :response

    def initialize(response)
      @response = response 
    end

    def id
    	response['id']
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

    def card
    	response['card']
    end

    def customer
        response['customer']
    end

    def token
       response['registrationId'] 
    end

    def token?
       response['registrationId'].present?
    end

    def card_type
        response['customParameters']['card_type']
    end

    def plan_id
        response['customParameters']['plan_id']
    end

    def payment_type
        response['paymentType']
    end

    def merchant_id
        response['merchantTransactionId']
    end

	end
end