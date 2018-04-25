if @certifications.present?
  json.array!(@certifications) do |cert|
    json.id cert.id
	json.license_type cert.license_type if cert.respond_to? :license_type
    json.license_number cert.license_number if cert.respond_to? :license_number
    json.country_of_issue cert.country_of_issue if cert.respond_to? :country_of_issue
    json.date_of_issue cert.date_of_issue if cert.respond_to? :date_of_issue
    json.date_of_expiry cert.date_of_expiry if cert.respond_to? :date_of_expiry
    json.license_authority cert.license_authority if cert.respond_to? :license_authority
    json.file (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + cert.file.url).to_s if cert.respond_to? :file_id and cert.file.present?
    json.first_aid cert.first_aid if cert.respond_to? :first_aid
    json.SEPT cert.SEPT if cert.respond_to? :SEPT
    json.DG cert.DG if cert.respond_to? :DG
    json.Ditching cert.Ditching if cert.respond_to? :Ditching
    json.Fire_fighting cert.Fire_fighting if cert.respond_to? :Fire_fighting
    json.endorsements cert.endorsements if cert.respond_to? :endorsements
    json.mcc cert.mcc if cert.respond_to? :mcc
    json.dangerous_goods cert.dangerous_goods if cert.respond_to? :dangerous_goods
    json.crm cert.crm if cert.respond_to? :crm
    json.tcas_acas cert.tcas_acas if cert.respond_to? :tcas_acas
    json.lvo cert.lvo if cert.respond_to? :lvo
    json.rnav_gnss cert.rnav_gnss if cert.respond_to? :rnav_gnss
    json.rvsm cert.rvsm if cert.respond_to? :rvsm
    json.cfit_gpws cert.cfit_gpws if cert.respond_to? :cfit_gpws
    json.etops cert.etops if cert.respond_to? :etops
   end
else
  json.response do
    json.code 404
  end
end



