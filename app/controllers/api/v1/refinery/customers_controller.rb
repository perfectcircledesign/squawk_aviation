class Api::V1::Refinery::CustomersController < Api::V1::BaseController
  respond_to :json

  def show
		@customer = Refinery::Customers::Customer.find_by_id(params[:id])
  end

  def update
  	@customer = Refinery::Customers::Customer.find_by_id(params[:id])
  	respond_to do |format|
	  	if @customer.update_attributes(params[:customer])
	        format.json { head :no_content }
      else
	        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @customer = Refinery::Customers::Customer.find_by_id(params[:id])
    if params[:search].present?
      @jobs = Refinery::Jobs::Job.is_active.where("UPPER(description) LIKE '%#{params[:search].upcase}%' or UPPER(name) LIKE '%#{params[:search].upcase}%'")
      @articles = Refinery::Articles::Article.where("UPPER(body) LIKE '%#{params[:search].upcase}%' or UPPER(name) LIKE '%#{params[:search].upcase}%'")
      @airlines = Refinery::Airlines::Airline.where("UPPER(name) LIKE '%#{params[:search].upcase}%' or UPPER(description) LIKE '%#{params[:search].upcase}%'")
    end
  end


end