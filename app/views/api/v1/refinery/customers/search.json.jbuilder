if @jobs.present? or @airlines.present? or @articles.present?
    json.query params[:search]
    json.jobs_count @jobs.count
    json.airlines_count @airlines.count
    json.articles_count @articles.count

  
    json.jobs do 
      if @jobs.present?
        json.array!(@jobs) do |job| 
          next unless job.airline.logo.present? and job.salary.present?
          json.id job.id
          json.date "#{time_ago_in_words(job.created_at)} ago"
          json.title job.name
          json.teaser truncate(job.description, :length => 260, :omission => '...')
          json.body job.description
          json.benefits job.benefits.split(', ')
          json.requirements job.requirements.split(', ')
          json.location job.location
          json.salary job.salary
          json.published_date job.published_date.strftime('%e %B %y') if job.published_date.present?
          json.expiry_date "#{time_ago_in_words(job.published_date)} ago" if job.published_date.present?
          json.favourited @customer.favourites.pluck(:job_id).compact.include? job.id
          json.follow_button @customer.favourites.pluck(:job_id).compact.include?(job.id) ? 'Unlike' : 'Like'
          json.airline do
            json.id job.airline.id
            json.name job.airline.airline_name
            json.body job.airline.description
            json.logo (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + job.airline.logo.url).to_s if job.airline.logo.present?
            json.job_count "#{job.airline.jobs.is_active.count} #{'Job'.pluralize(job.airline.jobs.is_active.count)} Listed"
          end
        end
      end

   end

    json.airlines do
      if @airlines.present?
        json.array!(@airlines) do | airline|
            json.extract! airline, :id, :name, :contact_number, :email, :airline_name, :head_office_address, :logo_id, :facebook, :twitter, :linkedin, :googleplus, :website, :description, :last_notification_id, :views_count
            json.job_count "#{airline.jobs.is_active.count} #{'Job'.pluralize(airline.jobs.is_active.count)} Listed"
            json.logo (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + airline.logo.url).to_s if airline.logo.present?
            json.favourited @customer.favourites.pluck(:airline_id).compact.include? airline.id
            json.follow_button @customer.favourites.pluck(:airline_id).compact.include?(airline.id) ? 'Unfollow' : 'Follow'
        end
      end
   end

  json.articles do
    if @articles.present?
      json.array!(@articles) do |article|
          next if !article.airline.present? or !article.image.present? or !article.airline.logo.present?
          json.image (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + article.image.url).to_s 
          json.airline_name article.airline.name
          json.date "#{time_ago_in_words(article.created_at)} ago"
          json.title article.name
          json.teaser truncate(article.body, :length => 260, :omission => '...')
          json.body article.body
          json.airline do
            json.id article.airline.id
            json.name article.airline.airline_name
            json.body article.airline.description
            json.logo (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + article.airline.logo.url).to_s
          end
        end
      end
   end

else
  json.response do
    json.code 404
  end
end

