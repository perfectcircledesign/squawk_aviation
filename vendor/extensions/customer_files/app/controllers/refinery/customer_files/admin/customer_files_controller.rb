module Refinery
  module CustomerFiles
    module Admin
      class CustomerFilesController < ::Refinery::AdminController

        crudify :'refinery/customer_files/customer_file',
                :title_attribute => 'file_mime_type', :xhr_paging => true

        def create
          @customer_files = Refinery::CustomerFiles::CustomerFile.create_customer_files(params[:customer_file])
          @resource = @customer_files.detect { |r| !r.valid? }

          unless params[:insert]

            if @customer_files.all?(&:valid?)
              flash.notice = t('created', :scope => 'refinery.crudify', :what => "'#{@customer_files.map(&:title).join("', '")}'")
              unless from_dialog?
                redirect_to refinery.customer_files_admin_customer_files_path
              else
                @dialog_successful = true
                render :nothing => true, :layout => true
              end
            else
              self.new # important for dialogs
              render :action => 'new'
            end
          else
            if @customer_files.all?(&:valid?)
              @resource_id = @customer_files.detect(&:persisted?).id
              @resource = nil

              self.insert
            end
          end
        end

      end
    end
  end
end
