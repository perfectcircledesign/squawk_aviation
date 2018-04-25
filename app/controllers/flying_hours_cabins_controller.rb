class FlyingHoursCabinsController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @flying_hours_cabin = FlyingHoursCabin.new(params[:flying_hours_cabin])
    if @flying_hours_cabin.save!
      total_hours
      redirect_to '/account#fly_tag'
    end
  end

  def edit

  end

  def update
    @flying_hours_cabin = FlyingHoursCabin.find(params[:id])
    if @flying_hours_cabin.update_attributes(params[:flying_hours_cabin])
      total_hours
      redirect_to '/account#fly_tag'
    end
  end

  def destroy
    item = FlyingHoursCabin.find(params[:id])
    item.destroy
    total_hours
    redirect_to '/account#fly_tag'
  end

  def total_hours
    customer = Refinery::Customers::Customer.find(current_customer.id)
    @flying_hours = FlyingHoursCabin.where(:customer_id => customer.id)
    if @flying_hours.present?
      customer.p1 = @flying_hours.to_a.sum { |e| e.flight_attendant.to_i }
      customer.p2 = @flying_hours.to_a.sum { |e| e.purser.to_i }
      customer.p3 = @flying_hours.to_a.sum { |e| e.chief_purser.to_i }
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

end
