class Api::V1::Refinery::EmploymentHistoriesController < Api::V1::BaseController
  respond_to :json

 def index
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present?
				@aviation_records = @customer.aviation_records
			end
  	end	
  end

 def update
    @education = AviationRecord.find_by_id(params[:id])
    respond_to do |format|
      if @education.update_attributes(params[:history])
          format.json { head :no_content }
      else
          format.json { render json: @education.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
    respond_to do |format|
      if AviationRecord.create(employer: params[:history][:employer], position_held: params[:history][:position_held], current_work: params[:history][:current_work], start_date: params[:history][:start_date], end_date: params[:history][:end_date], reason_for_leaving:params[:history][:reason_for_leaving] , customer_id: params[:customer_id])
          format.json { head :no_content }
      else
          format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end	
  end

end