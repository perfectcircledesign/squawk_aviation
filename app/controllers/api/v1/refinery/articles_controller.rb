class Api::V1::Refinery::ArticlesController < Api::V1::BaseController
  respond_to :json

  def index
  	@articles = Refinery::Articles::Article.all
  end

end