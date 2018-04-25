class Api::V1::Refinery::LogbooksController < Api::V1::BaseController
  respond_to :json

	def index
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present?
				@customer_files = @customer.customer_files
			end
  	end	
	end

  def update
  	
  end

  def create
  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
    @file = Base64.decode64(params[:logbook].split(',')[1])
    respond_to do |format|
      if Refinery::CustomerFiles::CustomerFile.create(file: @file , customer_id: params[:customer_id])
          format.json { head :no_content }
      else
          format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end 
  end


end