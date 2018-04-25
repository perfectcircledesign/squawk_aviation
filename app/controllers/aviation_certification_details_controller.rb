class AviationCertificationDetailsController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @aviation_certification = AviationCertificationDetail.new(params[:aviation_certification_detail])
    if @aviation_certification.save!

      if params[:aviation_file].present?
        file = Refinery::Resource.create(:file => params[:aviation_file])
        @aviation_certification.file_id = file.id
        @aviation_certification.save!
      end

      redirect_to '/account#certificate_tag'
    end
  end

  def edit

  end

  def update
    @aviation_certification = AviationCertificationDetail.find(params[:id])
    if @aviation_certification.update_attributes(params[:aviation_certification_detail])

      if params[:aviation_file].present?
        file = Refinery::Resource.create(:file => params[:aviation_file])
        @aviation_certification.file_id = file.id
        @aviation_certification.save!
      end
      redirect_to '/account#certificate_tag'
    end
  end

  def destroy
    item = AviationCertificationDetail.find(params[:id])
    item.destroy
    # flash[:notice] = 'File Successfully Deleted'
    redirect_to '/account#certificate_tag'
  end

end

