if @airlines.present?
  json.array!(@airlines.reverse!) do |a, airlines|
    airlines.each do |airline|
      json.extract! airline, :id, :name, :contact_number, :email, :airline_name, :head_office_address, :logo_id, :facebook, :twitter, :linkedin, :googleplus, :website, :description, :last_notification_id, :views_count
    	json.job_count "#{airline.jobs.is_active.count} #{'Job'.pluralize(airline.jobs.is_active.count)} Listed"
    	json.logo (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + airline.logo.url).to_s if airline.logo.present?
    	json.favourited @customer.favourites.pluck(:airline_id).compact.include? airline.id
    	json.follow_button @customer.favourites.pluck(:airline_id).compact.include?(airline.id) ? 'Unfollow' : 'Follow'
    end
  end
else
  json.response do
    json.code 404
  end
end