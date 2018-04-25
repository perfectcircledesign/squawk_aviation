class Api::V1::Refinery::AirlinesController < Api::V1::BaseController
  respond_to :json

  def index
  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
  	@airlines = Refinery::Airlines::Airline.all.group_by(&:active_jobs).to_a
  end

  def show
  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
  	@airline = Refinery::Airlines::Airline.find_by_id(params[:id])
  end

  def favourite
	  if params[:customer_id].present? and params[:airline_id].present?
	  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
	    favourite = Favourite.where("customer_id = ? AND airline_id = ? AND who_favourite = ?", @customer.id , params[:airline_id], 'pilot').first
	    if favourite.present?
	      favourite.destroy
	    else
	      Favourite.create(:airline_id => params[:airline_id], :customer_id => @customer.id, :who_favourite => 'pilot')
	    end
	  end
	end

	def favourited
		
	end

end