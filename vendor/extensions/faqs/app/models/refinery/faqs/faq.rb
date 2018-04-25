module Refinery
  module Faqs
    class Faq < Refinery::Core::BaseModel
      self.table_name = 'refinery_faqs'      
    
      acts_as_indexed :fields => [:question, :answer]

      attr_accessible :question, :answer, :position

      validates :question, :presence => true

      def title
        question
      end
              
    end
  end
end
