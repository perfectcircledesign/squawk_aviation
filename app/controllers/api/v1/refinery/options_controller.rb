class Api::V1::Refinery::OptionsController < Api::V1::BaseController
  respond_to :json

  def index
  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
  	@languages = ::Refinery::Languages::Language.order('position ASC')
  	@aircrafts = ::Refinery::Aircrafts::Aircraft.order(:name)
  	@route_experiences = ::Refinery::RouteExperiences::RouteExperience.order('airport ASC').group_by { |t| t.continent }
  end

end