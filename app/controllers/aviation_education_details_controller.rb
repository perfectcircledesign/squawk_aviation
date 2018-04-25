class AviationEducationDetailsController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @aviation_education = AviationEducationDetail.new(params[:aviation_education_detail])
    if @aviation_education.save!
      redirect_to '/account#education_tag'
    end
  end

  def edit

  end

  def update
    @aviation_education = AviationEducationDetail.find(params[:id])
    if @aviation_education.update_attributes(params[:aviation_education_detail])
      redirect_to '/account#education_tag'
    end
  end

  def destroy
    item = AviationEducationDetail.find(params[:id])
    item.destroy
    # flash[:notice] = 'File Successfully Deleted'
    redirect_to '/account#education_tag'
  end

end

