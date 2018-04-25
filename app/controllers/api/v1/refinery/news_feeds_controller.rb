class Api::V1::Refinery::NewsFeedsController < Api::V1::BaseController
  respond_to :json

  def customer
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present?
				@news_feed = ArticleJobLookup.joins(airline: :favourites).includes(:job).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.airline_id = refinery_airlines.id AND ((refinery_jobs.active = ? AND published_date <= ? AND expiry_date >= ?)  OR article_job_lookups.job_id IS null) ', 'pilot', @customer.id, true, DateTime.now, DateTime.now).order('article_job_lookups.created_at DESC')
			end
  	end
  end

end