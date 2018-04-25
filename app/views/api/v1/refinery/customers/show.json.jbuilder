if @customer.present?
    json.extract! @customer, :id, :first_name, :surname, :contact_number, :fax_number, :is_company, :company_name, :company_registration_number, :company_vat_number, :position, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at, :province, :sport, :register_for_wholesale, :is_wholesale, :dob, :age, :nationality, :gender, :ppc_date, :ppc_expiry_date, :ir_date, :ir_expiry_date, :total_flying_time, :pass_12_months_hours_flown, :dual_nationality_details, :marital_period, :notice_period, :icao, :military_commitment, :previously_interviewed, :previously_employed, :any_aircraft_accident, :any_criminal_records, :current_position, :current_aircraft, :current_airline, :address, :customer_country, :interviewed_if_yes, :employed_if_yes, :accident_if_yes, :online_application_number, :cover_letter, :p1, :p2, :p3, :turbine, :more_than, :other_number, :phone_extension1, :phone_extension2, :last_notification_id, :views_count, :career_path

   	json.profile_image (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + @customer.profile_image.url).to_s if @customer.profile_image.present?
   	json.name @customer.name
   	json.date_of_birth @customer.date_of_birth.strftime('%Y-%m-%d')
   	json.country country_name(@customer.nationality) 
   	json.country_of_residence country_name(@customer.dual_nationality_details) 
    json.language_ids @customer.languages.pluck(:id) if @customer.languages.present?
    json.formatted_languages @customer.languages.pluck(:name).join(', ')  if @customer.languages.present?
    json.route_experience_ids @customer.route_experiences.pluck(:id) if @customer.route_experiences.present?
    json.formatted_route_eperiences @customer.route_experiences.pluck(:continent).uniq
   	json.complete_percentage @customer.complete_percentage
else
  json.response do
    json.code 404
  end
end

