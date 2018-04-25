class Api::V1::Refinery::HoursController < Api::V1::BaseController
  respond_to :json

	def index
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present? and @customer.career_path == 'Pilot'
				@hours = @customer.flying_hours
			elsif @customer.present? and @customer.career_path == 'Cabin Crew'
				@hours = @customer.flying_hours_cabins
			end
  	end	
	end

  def update
    @customer = Refinery::Customers::Customer.find_by_id(params[:customer_id]) 
    respond_to do |format|
      if @customer.career_path == 'Pilot'
        @hours = FlyingHour.find_by_id(params[:id])
        if @hours.update_attributes(aircraft_id: params[:flying_hours][:aircraft_id], date_last_flown: params[:flying_hours][:date_last_flown], ca: params[:flying_hours][:ca], fo: params[:flying_hours][:fo], cruise_only_pilot: params[:flying_hours][:cruise_only_pilot])
            format.json { head :no_content }
        else
            format.json { render json: @hours.errors, status: :unprocessable_entity }
        end
      elsif @customer.career_path == 'Cabin Crew'
        @hours = FlyingHoursCabin.find_by_id(params[:id])
        if hours.update_attributes(aircraft_id: params[:flying_hours][:aircraft_id], date_last_flown: params[:flying_hours][:date_last_flown], flight_attendant: params[:flying_hours][:ca], purser: params[:flying_hours][:fo], chief_purser: params[:flying_hours][:cruise_only_pilot])
            format.json { head :no_content }
        else
            format.json { render json: @hours.errors, status: :unprocessable_entity }
        end
      end
    end 
  end

  def create
  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id]) 
    respond_to do |format|
      if @customer.career_path == 'Pilot'
        if FlyingHour.create(aircraft_id: params[:flying_hours][:aircraft_id], date_last_flown: params[:flying_hours][:date_last_flown], ca: params[:flying_hours][:ca], fo: params[:flying_hours][:fo], cruise_only_pilot: params[:flying_hours][:cruise_only_pilot], customer_id: params[:customer_id])
            format.json { head :no_content }
        else
            format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      elsif @customer.career_path == 'Cabin Crew'
        if FlyingHoursCabin.create(aircraft_id: params[:flying_hours][:aircraft_id], date_last_flown: params[:flying_hours][:date_last_flown], flight_attendant: params[:flying_hours][:ca], purser: params[:flying_hours][:fo], chief_purser: params[:flying_hours][:cruise_only_pilot], customer_id: params[:customer_id])
            format.json { head :no_content }
        else
            format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    end 
  end

end
