class Admin::JobsController < AdminController

  def index
    @jobs = Refinery::Jobs::Job.all
  end

  def show
    @job = Refinery::Jobs::Job.find_by_id(params[:id])
  end

end