module Refinery
  module RouteExperiences
    class RouteExperience < Refinery::Core::BaseModel
      self.table_name = 'refinery_route_experiences'

      CONTINENTS = ['Asia Pacific', 'Europe', 'Middle east and Africa', 'North Asia', 'The Americas']
    
      acts_as_indexed :fields => [:continent, :airport]
      attr_accessible :continent, :airport, :position

      validates :continent, :presence => true
      validates :airport, :presence => true
      has_and_belongs_to_many :customers, :class_name => 'Refinery::Customers::Customer', join_table: 'refinery_customers_routes'
              
    end
  end
end
