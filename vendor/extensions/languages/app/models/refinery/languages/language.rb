module Refinery
  module Languages
    class Language < Refinery::Core::BaseModel
      self.table_name = 'refinery_languages'      
    
      acts_as_indexed :fields => [:name]

      attr_accessible :name, :position

      validates :name, :presence => true, :uniqueness => true

      has_and_belongs_to_many :customers, :class_name => 'Refinery::Customers::Customer', join_table: 'refinery_customers_languages'
              
    end
  end
end
