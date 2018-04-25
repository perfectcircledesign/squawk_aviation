module PeachPayments
    class CaptureTokenResult
        
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

    def code
        response['result']['code']
    end

    def description
        response['result']['description']
    end

    def risk
        response['risk']['score']
    end

    end
end