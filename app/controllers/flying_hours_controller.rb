class FlyingHoursController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @flying_hour = FlyingHour.new(params[:flying_hour])
    if @flying_hour.save!
      total_hours
      # set_customer_aircraft_search
      redirect_to '/account#fly_tag'
    end
  end

  def edit

  end

  def update
    @flying_hour = FlyingHour.find(params[:id])
    if @flying_hour.update_attributes(params[:flying_hour])
      total_hours
      # set_customer_aircraft_search
      redirect_to '/account#fly_tag'
    end
  end

  def destroy
    item = FlyingHour.find(params[:id])
    item.destroy
    # flash[:notice] = 'File Successfully Deleted'
    total_hours
    # set_customer_aircraft_search
    redirect_to '/account#fly_tag'
  end

  def total_hours
    customer = Refinery::Customers::Customer.find(current_customer.id)
    @flying_hours = FlyingHour.where(:customer_id => customer.id)
    if @flying_hours.present?
      customer.p1 = @flying_hours.to_a.sum { |e| e.ca.to_i }
      customer.p2 = @flying_hours.to_a.sum { |e| e.fo.to_i }
      customer.p3 = @flying_hours.to_a.sum { |e| e.cruise_only_pilot.to_i }
      customer.total_flying_time = customer.p1.to_i + customer.p2.to_i + customer.p3.to_i
      customer.save
    else
      customer.p1 = 0
      customer.p2 = 0
      customer.p3 = 0
      customer.total_flying_time = 0
      customer.save
    end


  end

  def set_customer_aircraft_search
    customer = Refinery::Customers::Customer.find(current_customer.id)
    @flying_hours = FlyingHour.where(:customer_id => customer.id)
    if @flying_hours.present?
      # customer.more_than = true if @flying_hours.map{ |item| item.aircraft.weight == "more then"}.include? true
      # customer.turbine = true if @flying_hours.map{ |item| item.aircraft.engine == "turbine"}.include? true
    end
    customer.save
  end

end

