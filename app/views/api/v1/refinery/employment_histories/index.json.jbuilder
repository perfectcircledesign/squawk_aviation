if @aviation_records.present?
  json.array!(@aviation_records) do |ar|
  	json.id ar.id
		json.employer ar.employer
		json.aircraft ar.aircraft
		json.start_date ar.start_date
		json.end_date ar.end_date
		json.ca ar.ca
		json.fo ar.fo
		json.total ar.total
		json.reason_for_leaving ar.reason_for_leaving
		json.current_work ar.current_work
		json.notice_period ar.notice_period
		json.position_held ar.position_held
  end
else
  json.response do
    json.code 404
  end
end