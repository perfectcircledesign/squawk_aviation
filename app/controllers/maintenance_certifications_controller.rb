class MaintenanceCertificationsController < ::ApplicationController

  before_filter :authenticate_customer!

  def new

  end

  def create
    @maintenance_certification = MaintenanceCertification.new(params[:maintenance_certification])
    if @maintenance_certification.save!

      if params[:aviation_file].present?
        file = Refinery::Resource.create(:file => params[:aviation_file])
        @maintenance_certification.file_id = file.id
        @maintenance_certification.save!
      end

      redirect_to '/account#certificate_tag'
    end
  end

  def edit

  end

  def update
    @maintenance_certification = MaintenanceCertification.find(params[:id])
    if @maintenance_certification.update_attributes(params[:maintenance_certification])

      if params[:aviation_file].present?
        file = Refinery::Resource.create(:file => params[:aviation_file])
        @maintenance_certification.file_id = file.id
        @maintenance_certification.save!
      end
      redirect_to '/account#certificate_tag'
    end
  end

  def destroy
    item = MaintenanceCertification.find(params[:id])
    item.destroy
    # flash[:notice] = 'File Successfully Deleted'
    redirect_to '/account#certificate_tag'
  end

end

