module Refinery
  module Invoices
    module Admin
      class InvoicesController < ::Refinery::AdminController

        crudify :'refinery/invoices/invoice',
                :title_attribute => 'invoice_number', :xhr_paging => true

      end
    end
  end
end
