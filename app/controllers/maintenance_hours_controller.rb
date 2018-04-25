class MaintenanceHoursController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @maintenance_hour = MaintenanceHour.new(params[:maintenance_hour])
    if @maintenance_hour.save!
      total_hours
      redirect_to '/account#fly_tag'
    end
  end

  def edit

  end

  def update
    @maintenance_hour = MaintenanceHour.find(params[:id])
    if @maintenance_hour.update_attributes(params[:maintenance_hour])
      total_hours
      redirect_to '/account#fly_tag'
    end
  end

  def destroy
    item = MaintenanceHour.find(params[:id])
    item.destroy
    total_hours
    redirect_to '/account#fly_tag'
  end

  def total_hours
    customer = Refinery::Customers::Customer.find(current_customer.id)
    @hours = MaintenanceHour.where(:customer_id => customer.id)
    if @hours.present?
      customer.total_flying_time = @hours.to_a.sum { |e| e.total_hours.to_i }
      customer.save
    else
      customer.total_flying_time = 0
      customer.save
    end


  end

end
