module Refinery
  module CustomerFiles
    class CustomerFilesController < ::ApplicationController
      before_filter :authenticate_customer!

      # before_filter :find_all_customer_files
      before_filter :find_page

      def index
        @customer_file = CustomerFile.new
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @customer_file in the line below:
        present(@page)
      end

      def show
        @customer_file = CustomerFile.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @customer_file in the line below:
        present(@page)
      end

      def create
        if params[:customer_file].present?
          require 'ostruct'
          his_image = RStruct.new(eval(params[:customer_file].gsub(':','=>').gsub('null','nil')))
          if his_image.present? and his_image.output.type.include? "image"
            @customer_file = Refinery::CustomerFiles::CustomerFile.create(:file => Base64.decode64(his_image.output.image['data=>image/png;base64,'.length .. -1]), :customer_id => current_customer.id)
            @customer_file.save!
            redirect_to '/account#logbook'
          end
        end
        # if params[:customer_file].present?
        #   @customer_file = Refinery::CustomerFiles::CustomerFile.create(:file => params[:customer_file], :customer_id => current_customer.id)
        #   @customer_file.save!
        #   redirect_to '/account#logbook'
        # end
      end

      def destroy
        @customer_file = Refinery::CustomerFiles::CustomerFile.find(params[:id])
        @customer_file.destroy
        flash[:notice] = 'File Successfully Deleted'
        redirect_to '/account#logbook'
      end

      def customer_send_file
        @customer_files = Refinery::CustomerFiles::CustomerFile.create_customer_files(params[:customer_file])
        @resource = @customer_files.detect { |r| !r.valid? }

        unless params[:insert]
          if @customer_files.all?(&:valid?)
            flash[:notice] = 'Upload Successfully'
            redirect_to '/account#logbook'
          else
            Refinery::CustomerFiles::CustomerFile.new # important for dialogs
            flash[:alert] = 'Upload Failed'
            redirect_to '/account#logbook'
          end
        else
          if @customer_files.all?(&:valid?)
            @resource_id = @customer_files.detect(&:persisted?).id
            @resource = nil

            self.insert
          end
        end
      end

    protected

      # def find_all_customer_files
      #   @customer_files = CustomerFile.order('position ASC')
      # end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/customer_files").first
      end

    end
  end
end
