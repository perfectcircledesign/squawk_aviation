module Refinery
  module Employers
    class EmployersController < ::ApplicationController

      before_filter :find_all_employers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @employer in the line below:
        present(@page)
      end

      def show
        @employer = Employer.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @employer in the line below:
        present(@page)
      end

    protected

      def find_all_employers
        @employers = Employer.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/employers").first
      end

    end
  end
end
