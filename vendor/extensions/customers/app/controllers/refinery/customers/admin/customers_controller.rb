module Refinery
  module Customers
    module Admin
      class CustomersController < ::Refinery::AdminController

        crudify :'refinery/customers/customer',
                :title_attribute => 'first_name', :xhr_paging => true

        def user_send_file
          @customer_files = Refinery::CustomerFiles::CustomerFile.create_customer_files(params[:customer_file])
          @resource = @customer_files.detect { |r| !r.valid? }

          unless params[:insert]
            if @customer_files.all?(&:valid?)
              flash[:notice] = 'Upload Successfully'
              # flash.notice = t('created', :scope => 'refinery.crudify', :what => "'#{@customer_files.map(&:title).join("', '")}'")
              redirect_to refinery.customers_customer_path(:id => params[:customer_file][:customer_id])

            else
              Refinery::CustomerFiles::CustomerFile.new # important for dialogs
              flash[:alert] = 'Upload Failed'
              redirect_to refinery.customers_customer_path(:id => params[:customer_file][:customer_id])
            end
          else
            if @customer_files.all?(&:valid?)
              @resource_id = @customer_files.detect(&:persisted?).id
              @resource = nil

              self.insert
            end
          end
        end

        def customer_list
          respond_to do |format|
            format.csv  { send_data Refinery::Customers::Customer.to_csv }
            format.xls
          end
        end

        def imitate_customer
          sign_in(Customer.find(params[:id]))
          redirect_to '/account'
        end

      end
    end
  end
end
