module Refinery
  module Messages
    class Message < Refinery::Core::BaseModel
      self.table_name = 'refinery_messages'      
    
      acts_as_indexed :fields => [:message, :sender]

      validates :message, :presence => true

      attr_accessible :message, :airline_id, :customer_id, :seen, :sender, :position

      belongs_to :airline, :class_name => '::Refinery::Airlines::Airline'
      belongs_to :customer, :class_name => '::Refinery::Customers::Customer'
              
    end
  end
end
