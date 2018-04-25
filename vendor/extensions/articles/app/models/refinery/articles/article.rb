module Refinery
  module Articles
    class Article < Refinery::Core::BaseModel
      self.table_name = 'refinery_articles'      

      after_create :create_lookup_record

      acts_as_indexed :fields => [:name, :body]

      attr_accessible :name, :body, :image_id, :airline_id, :position, :url

      validates :name, :presence => true
      validates :body, :presence => true
          
      belongs_to :image, :class_name => '::Refinery::Image'
      belongs_to :airline, :class_name => '::Refinery::Airlines::Airline'
      has_one :article_job_lookup, :class_name => 'ArticleJobLookup'

      def create_lookup_record
        ArticleJobLookup.create(:article_id => self.id, :airline_id => self.airline_id)
      end
    end
  end
end
