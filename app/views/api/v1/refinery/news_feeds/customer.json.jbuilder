if @news_feed.present?
  json.array!(@news_feed) do |item|
    if item.article.present?
    	json.type 'Article'    	  
	    json.image (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + item.article.image.url).to_s 
	    json.airline_name item.article.airline.name
	    json.date "#{time_ago_in_words(item.article.created_at)} ago"
	    json.title item.article.name
	    json.teaser truncate(item.article.body, :length => 260, :omission => '...')
	    json.body item.article.body
	    json.airline do
	    	json.id item.article.airline.id
  			json.name item.article.airline.airline_name
  			json.body item.article.airline.description
  			json.logo (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + item.article.airline.logo.url).to_s
  		end
    elsif item.job.present? and item.job.is_active?
    	json.type 'Job'    	   	
    	json.id item.job.id
	    json.airline_name item.job.airline.name
	    json.date "#{time_ago_in_words(item.job.created_at)} ago"
	    json.title item.job.name
	    json.teaser truncate(item.job.description, :length => 260, :omission => '...')
	    json.body item.job.description
	    json.benefits item.job.benefits.split(', ')
	    json.requirements item.job.requirements.split(', ')
	    json.location item.job.location
	    json.salary item.job.salary
	    json.published_date item.job.published_date.strftime('%e %B %y')
	    json.favourited @customer.favourites.pluck(:job_id).compact.include? item.job.id
      json.follow_button @customer.favourites.pluck(:job_id).compact.include?(item.job.id) ? 'Unlike' : 'Like'
	    json.airline do
	    	json.id item.job.airline.id
  			json.name item.job.airline.airline_name
  			json.logo (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + item.job.airline.logo.url).to_s
  		end
    end
  end
else
  json.response do
    json.code 404
  end
end

