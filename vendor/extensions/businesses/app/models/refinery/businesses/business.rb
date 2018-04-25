module Refinery
  module Businesses
    class Business < Refinery::Core::BaseModel
      self.table_name = 'refinery_businesses'      
    
      acts_as_indexed :fields => [:name, :description]

      attr_accessible :name, :description, :position

      validates :name, :presence => true, :uniqueness => true
              
    end
  end
end
