class Api::V1::Refinery::PagesController < Api::V1::BaseController
  respond_to :json

  def index
  	@pages = Refinery::Page.live.in_menu
  end

end