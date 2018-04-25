module Refinery
  module Plans
    class Plan < Refinery::Core::BaseModel
      self.table_name = 'refinery_plans'      
    
      acts_as_indexed :fields => [:name, :currency, :duration, :description]

      attr_accessible :name, :currency, :duration, :description, :position, :cost

      validates :name, :presence => true, :uniqueness => true

      has_many :subscriptions, :class_name => 'Refinery::Subscriptions::Subscription'
              
    end
  end
end
