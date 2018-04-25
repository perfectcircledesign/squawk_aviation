module Refinery
  module Employers
    class Employer < Refinery::Core::BaseModel
      self.table_name = 'refinery_employers'      
    
      acts_as_indexed :fields => [:name, :url]

      validates :name, :presence => true, :uniqueness => true

      attr_accessible :name, :image_id, :url, :position
          
      belongs_to :image, :class_name => '::Refinery::Image'
        
    end
  end
end
