if @hours.present?
  json.array!(@hours) do |hour|
  	json.id hour.id
		json.mtow hour.mtow if hour.respond_to? :mtow
		json.aircraft hour.aircraft
		json.date_first_flown hour.date_first_flown
		json.date_last_flown hour.date_last_flown
		json.total_hours hour.total_hours
		json.aircraft hour.aircraft.name if hour.aircraft.present?

		if @customer.career_path == 'Pilot'
			json.ca hour.ca
			json.fo hour.fo
			json.cruise_only_pilot hour.cruise_only_pilot
		elsif @customer.career_path == 'Cabin Crew'
			json.ca hour.send(:flight_attendant) if hour.respond_to? :flight_attendant
			json.fo hour.purser if hour.respond_to? :purser
			json.cruise_only_pilot hour.chief_purser if hour.respond_to? :chief_purser
		end
  end
else
  json.response do
    json.code 404
  end
end



