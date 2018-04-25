if @customer_files.present?
  json.array!(@customer_files) do |customer_file|
		json.file (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + customer_file.file.url).to_s if customer_file.file.present?
   end
else
  json.response do
    json.code 404
  end
end



