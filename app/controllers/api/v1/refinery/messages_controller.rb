class Api::V1::Refinery::MessagesController < Api::V1::BaseController
  respond_to :json

  def index
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present?
				@messengers = Refinery::Airlines::Airline.eager_load(:messages).where("refinery_messages.customer_id = ?", @customer.id).order('refinery_messages.created_at DESC')
			end
  	end
  end

  def show
  	@messages = Refinery::Messages::Message.where("customer_id = ? AND airline_id = ?", params[:customer_id] , params[:id]).order('created_at ASC')
  end

  def create
    @customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
    @airline = Refinery::Airlines::Airline.find_by_id(params[:airline_id])
    respond_to do |format|
      if Refinery::Messages::Message.create(message: params[:message], customer_id: params[:customer_id], airline_id: params[:airline_id], sender: 'user-message')
          format.json { head :no_content }
      else
          format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end 
  end

end