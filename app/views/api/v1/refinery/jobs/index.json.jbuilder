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
else
  json.response do
    json.code 404
  end
end