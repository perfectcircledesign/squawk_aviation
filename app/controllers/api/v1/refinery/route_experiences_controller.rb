class Api::V1::Refinery::RouteExperiencesController < Api::V1::BaseController
  respond_to :json

  def index
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present?
				@route_experiences = @customer.route_experiences
			end
  	end	
  end

  def update
  	
  end

  def create
  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
    respond_to do |format|
      if RouteExperience.create(city_destinations: params[:routes][:city_destinations], continent_flown_to: params[:routes][:continent_flown_to], customer_id: params[:customer_id])
          format.json { head :no_content }
      else
          format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end


end