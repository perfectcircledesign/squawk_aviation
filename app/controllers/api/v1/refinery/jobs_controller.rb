class Api::V1::Refinery::JobsController < Api::V1::BaseController
  respond_to :json

  def index
    @customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
    if params[:liked].present?
      @jobs = Refinery::Jobs::Job.eager_load(:favourites).where('favourites.who_favourite = ? AND favourites.customer_id = ? AND favourites.job_id = refinery_jobs.id', 'pilot', @customer.id)
    else
      @jobs = Refinery::Jobs::Job.is_active.order('created_at DESC')
    end
  end

  def show
    @customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
    @job = Refinery::Jobs::Job.find_by_id(params[:id])
  end



  def favourite
    if params[:customer_id].present? and params[:job_id].present?
      @customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
      favourite = Favourite.where("customer_id = ? AND job_id = ? AND who_favourite = ?", @customer.id , params[:job_id], 'pilot').first
      if favourite.present?
        favourite.destroy
      else
        Favourite.create(:job_id => params[:job_id], :customer_id => @customer.id, :who_favourite => 'pilot')
        job = Refinery::Jobs::Job.find(params[:job_id])
        if Refinery::Notifications::Notification.valid?(Refinery::Notifications::Notification::PILOT_JOB, @customer.id, @customer.class.name, job.airline.id, job.airline.class.name)
          Refinery::Notifications::Notification.create!(notification_type: Refinery::Notifications::Notification::PILOT_JOB, url: "/customers/#{@customer.id}", sender_id: @customer.id, sender_class: @customer.class.name, receiver_id: job.airline.id, receiver_class:  job.airline.class.name)
        end
      end
    end
  end

  



end