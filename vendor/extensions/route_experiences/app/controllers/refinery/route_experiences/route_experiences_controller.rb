module Refinery
  module RouteExperiences
    class RouteExperiencesController < ::ApplicationController

      before_filter :find_all_route_experiences
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @route_experience in the line below:
        present(@page)
      end

      def show
        @route_experience = RouteExperience.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @route_experience in the line below:
        present(@page)
      end

    protected

      def find_all_route_experiences
        @route_experiences = RouteExperience.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/route_experiences").first
      end

    end
  end
end
