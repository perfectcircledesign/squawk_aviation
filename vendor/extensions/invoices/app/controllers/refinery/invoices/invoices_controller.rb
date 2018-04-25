module Refinery
  module Invoices
    class InvoicesController < ::ApplicationController

      before_filter :you_don_not_belong_here

      def you_don_not_belong_here
        redirect_to '/', alert: 'You do not belong here'
      end

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @invoice in the line below:
        present(@page)
      end

      def show
        @invoice = Invoice.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @invoice in the line below:
        present(@page)
      end

    protected

      # def find_all_invoices
      #   @invoices = Invoice.order('position ASC')
      # end

      # def find_page
      #   @page = ::Refinery::Page.where(:link_url => "/invoices").first
      # end

    end
  end
end
