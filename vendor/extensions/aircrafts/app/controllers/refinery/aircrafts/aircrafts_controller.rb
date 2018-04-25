module Refinery
  module Aircrafts
    class AircraftsController < ::ApplicationController

      before_filter :find_all_aircrafts
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @aircraft in the line below:
        present(@page)
      end

      def show
        @aircraft = Aircraft.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @aircraft in the line below:
        present(@page)
      end

    protected

      def find_all_aircrafts
        @aircrafts = Aircraft.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/aircrafts").first
      end

    end
  end
end
