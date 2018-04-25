module Refinery
  module Products
    class Product < Refinery::Core::BaseModel
      self.table_name = 'refinery_products'      
    
      acts_as_indexed :fields => [:name, :description]

      attr_accessible :name, :description, :price, :position

      validates :name, :presence => true, :uniqueness => true
              
    end
  end
end
