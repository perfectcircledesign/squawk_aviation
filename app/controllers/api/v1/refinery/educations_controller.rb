class Api::V1::Refinery::EducationsController < Api::V1::BaseController
  respond_to :json

  def index
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present?
				@education = @customer.aviation_education_details
			end
  	end	
  end

  def create
  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
    respond_to do |format|
      if AviationEducationDetail.create(program: params[:education][:program], institution: params[:education][:institution], period: params[:education][:period], customer_id: params[:customer_id])
          format.json { head :no_content }
      else
          format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	@education = AviationEducationDetail.find_by_id(params[:id])
    respond_to do |format|
      if @education.update_attributes(params[:education])
          format.json { head :no_content }
      else
          format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end




end