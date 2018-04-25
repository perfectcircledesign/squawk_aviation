json.route_experiences @route_experiences.each do |continent, airports|
	json.continent continent
	json.class continent.downcase.gsub(' ', '_')
	json.airports airports.each do |airport|
		json.id airport.id
		json.value airport.airport
	end
end
json.aircraft do
	json.array!(@aircrafts) do |aircraft|
		json.id aircraft.id
		json.value aircraft.name
	end
end
json.languages do
	json.array!(@languages) do |language|
		json.id language.id
		json.value language.name
  end
end
json.labels do 
	if @customer.career_path == 'Pilot'
		json.ca_label 'Captain (P1)'
		json.fo_label 'First Officer (P2)'
		json.cruise_only_pilot_label 'Cruise Only (P3/FE)'
	elsif @customer.career_path == 'Cabin Crew'
		json.ca_label 'Flight Attendant'
		json.fo_label 'Chief Purser'
		json.cruise_only_pilot_label 'Cruise Only (P3/FE)'
	end
end



