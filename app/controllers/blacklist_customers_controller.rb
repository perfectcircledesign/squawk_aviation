class BlacklistCustomersController < ::ApplicationController

  before_filter :authenticate_airline!

  def new

  end

  def blacklist
    if current_airline.present? and params[:customer_id].present?
      blacklist = BlacklistCustomer.where('customer_id = ? AND airline_id = ?', params[:customer_id], current_airline.id).first
      if blacklist.present?
        blacklist.destroy
      else
        BlacklistCustomer.create!(:airline_id => current_airline.id, :customer_id => params[:customer_id])
      end
      redirect_to '/customers'
    end
  end






  # def create
  #   @route_experience = RouteExperience.new(params[:route_experience])
  #   if @route_experience.save!
  #     redirect_to '/account#route_tag'
  #   end
  # end
  #
  # def edit
  #
  # end
  #
  # def update
  #   @route_experience = RouteExperience.find(params[:id])
  #   if @route_experience.update_attributes(params[:route_experience])
  #     redirect_to '/account#route_tag'
  #   end
  # end
  #
  # def destroy
  #   item = RouteExperience.find(params[:id])
  #   item.destroy
  #   # flash[:notice] = 'File Successfully Deleted'
  #   redirect_to '/account#route_tag'
  # end

end

