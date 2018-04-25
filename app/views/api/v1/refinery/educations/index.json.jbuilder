if @education.present?
  json.array!(@education) do |school|
  json.id school.id
	json.program school.program
	json.institution school.institution
	json.period school.period
  end
else
  json.response do
    json.code 404
  end
end