class AviationRecordsController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @aviation_record = AviationRecord.new(params[:aviation_record])
    if @aviation_record.save!
      current_work_place
      redirect_to '/account#employment_tag'
    end
  end

  def edit

  end

  def update
    @aviation_record = AviationRecord.find(params[:id])
    if @aviation_record.update_attributes(params[:aviation_record])
      current_work_place
      redirect_to '/account#employment_tag'
    end
  end

  def destroy
    item = AviationRecord.find(params[:id])
    item.destroy
    current_work_place
    # flash[:notice] = 'File Successfully Deleted'
    redirect_to '/account#employment_tag'
  end

  def current_work_place
    customer = Refinery::Customers::Customer.find(current_customer.id)
    @aviation_record = AviationRecord.where(:customer_id => customer.id)
    if @aviation_record.present?
      item = @aviation_record.where(:current_work => true).first
      if item.present?
        customer.current_airline = item.employer
        customer.notice_period = item.notice_period
      else
        customer.current_airline = "Not Currently Employed"
      end
    end
    customer.save
  end


end

