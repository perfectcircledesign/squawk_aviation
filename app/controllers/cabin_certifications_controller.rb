class CabinCertificationsController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @cabin_certification = CabinCertification.new(params[:cabin_certification])
    if @cabin_certification.save!

      if params[:aviation_file].present?
        file = Refinery::Resource.create(:file => params[:aviation_file])
        @cabin_certification.file_id = file.id
        @cabin_certification.save!
      end

      redirect_to '/account#certificate_tag'
    end
  end

  def edit

  end

  def update
    @cabin_certification = CabinCertification.find(params[:id])
    if @cabin_certification.update_attributes(params[:cabin_certification])

      if params[:aviation_file].present?
        file = Refinery::Resource.create(:file => params[:aviation_file])
        @cabin_certification.file_id = file.id
        @cabin_certification.save!
      end
      redirect_to '/account#certificate_tag'
    end
  end

  def destroy
    item = CabinCertification.find(params[:id])
    item.destroy
    # flash[:notice] = 'File Successfully Deleted'
    redirect_to '/account#certificate_tag'
  end

end

