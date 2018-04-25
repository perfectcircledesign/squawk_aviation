class ArticleJobLookup < ActiveRecord::Base
  self.table_name = 'article_job_lookups'

  attr_accessible :airline_id, :article_id, :job_id

  belongs_to :article, :class_name => 'Refinery::Articles::Article'
  belongs_to :airline, :class_name => 'Refinery::Airlines::Airline'
  belongs_to :job, :class_name => 'Refinery::Jobs::Job'
end
