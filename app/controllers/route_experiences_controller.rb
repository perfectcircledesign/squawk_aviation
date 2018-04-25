class RouteExperiencesController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @route_experience = RouteExperience.new(params[:route_experience])
    if @route_experience.save!
      redirect_to '/account#route_tag'
    end
  end

  def edit

  end

  def update
    @route_experience = RouteExperience.find(params[:id])
    if @route_experience.update_attributes(params[:route_experience])
      redirect_to '/account#route_tag'
    end
  end

  def destroy
    item = RouteExperience.find(params[:id])
    item.destroy
    # flash[:notice] = 'File Successfully Deleted'
    redirect_to '/account#route_tag'
  end

end

