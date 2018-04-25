class Api::V1::Refinery::CertificationsController < Api::V1::BaseController
  respond_to :json

  def index
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present? and @customer.career_path == 'Pilot'
				@certifications = @customer.aviation_certification_details
			elsif @customer.present? and @customer.career_path == 'Cabin Crew'
				@certifications = @customer.cabin_certifications
			else
				@certifications = @customer.maintenance_certifications
			end
  	end	
  end

def update
    @customer = Refinery::Customers::Customer.find_by_id(params[:customer_id]) 
      respond_to do |format|
        if @customer.career_path == 'Pilot'
          @cert = AviationCertificationDetail.find_by_id(params[:id])
          if @cert.update_attributes(license_type: params[:certification][:license_type], license_number: params[:certification][:license_number], country_of_issue: params[:certification][:country_of_issue], date_of_issue: params[:certification][:date_of_issue], date_of_expiry: params[:certification][:date_of_expiry], license_authority: params[:certification][:license_authority], mcc: params[:certification][:mcc], dangerous_goods: params[:certification][:dangerous_goods], crm: params[:certification][:crm], tcas_acas: params[:certification][:tcas_acas], lvo: params[:certification][:lvo], rnav_gnss: params[:certification][:rnav_gnss], rvsm: params[:certification][:rvsm], cfit_gpws: params[:certification][:cfit_gpws], etops: params[:certification][:etops], file_id: params[:certification][:file_id])
              format.json { head :no_content }
          else
              format.json { render json: @customer.errors, status: :unprocessable_entity }
          end
        elsif @customer.career_path == 'Cabin Crew'
          @cert = CabinCertification.find_by_id(params[:id])
          if @cert.update_attributes(license_authority: params[:certification][:license_authority], first_aid: params[:certification][:first_aid], CRM: params[:certification][:CRM], SEPT: params[:certification][:SEPT], DG: params[:certification][:DG], Ditching: params[:certification][:Ditching], Fire_fighting: params[:certification][:Fire_fighting], file_id: params[:certification][:file_id])
              format.json { head :no_content }
          else
              format.json { render json: @customer.errors, status: :unprocessable_entity }
          end
        else
          @cert = MaintenanceCertification.find_by_id(params[:id])
          if @cert.update_attributes(license_authority: params[:certification][:license_authority], license_type: params[:certification][:license_type], file_id: params[:certification][:file_id])
              format.json { head :no_content }
          else
              format.json { render json: @customer.errors, status: :unprocessable_entity }
          end
        end
    end 

  end


def create
    @customer = Refinery::Customers::Customer.find_by_id(params[:customer_id]) 
    respond_to do |format|
      if @customer.career_path == 'Pilot'
        if AviationCertificationDetail.create(license_type: params[:certification][:license_type], license_number: params[:certification][:license_number], country_of_issue: params[:certification][:country_of_issue], date_of_issue: params[:certification][:date_of_issue], date_of_expiry: params[:certification][:date_of_expiry], customer_id: params[:customer_id], license_authority: params[:certification][:license_authority], mcc: params[:certification][:mcc], dangerous_goods: params[:certification][:dangerous_goods], crm: params[:certification][:crm], tcas_acas: params[:certification][:tcas_acas], lvo: params[:certification][:lvo], rnav_gnss: params[:certification][:rnav_gnss], rvsm: params[:certification][:rvsm], cfit_gpws: params[:certification][:cfit_gpws], etops: params[:certification][:etops], file_id: params[:certification][:file_id])
            format.json { head :no_content }
        else
            format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      elsif @customer.career_path == 'Cabin Crew'
        if CabinCertification.create(license_authority: params[:certification][:license_authority], first_aid: params[:certification][:first_aid], CRM: params[:certification][:CRM], SEPT: params[:certification][:SEPT], DG: params[:certification][:DG], Ditching: params[:certification][:Ditching], Fire_fighting: params[:certification][:Fire_fighting], file_id: params[:certification][:file_id], customer_id: params[:customer_id])
            format.json { head :no_content }
        else
            format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      else
        if MaintenanceCertification.create(license_authority: params[:certification][:license_authority], license_type: params[:certification][:license_type], customer_id: params[:customer_id], file_id: params[:certification][:file_id])
            format.json { head :no_content }
        else
            format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    end 
  end

end




