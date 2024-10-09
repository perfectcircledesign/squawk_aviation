module Refinery
  module Airlines
    class AirlinesController < ::ApplicationController

      before_filter :find_all
      before_filter :find_page
      layout :determine_user_layout
      skip_before_filter :check_customer, :only => [:favourite_airline]

      before_filter :authenticate_airline!, :except => [:index, :show, :favourite_airline]

      def index
        @show_nav = true
        if params[:airline_search].present?
          @airlines = Refinery::Airlines::Airline.active.where("UPPER(name) LIKE '%#{params[:airline_search].upcase}%'").group_by(&:active_jobs).to_a
        else
          @airlines = Refinery::Airlines::Airline.active.group_by(&:active_jobs).to_a
        end
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @airline in the line below:
        present(@page)
      end

      def show
        @airline = Airline.find(params[:id])

        if @airline.valid_airline
          if @airline.views_count.present?
            @airline.views_count = @airline.views_count + 1
          else
            @airline.views_count = 1
          end
          @airline.save!
        else
          redirect_to '/airlines'
        end

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @airline in the line below:
        present(@page)
      end

      def favourite_airline
        if current_customer.present? and params[:airline_id].present?
          favourite = Favourite.where("customer_id = ? AND airline_id = ? AND who_favourite = ?", current_customer.id , params[:airline_id], 'pilot').first
          if favourite.present?
            favourite.destroy
          else
            Favourite.create(:airline_id => params[:airline_id], :customer_id => current_customer.id, :who_favourite => 'pilot')
            @favourite_airline = ::Refinery::Airlines::Airline.where(id: params[:airline_id]).first
          end
        end
      end

    protected

      def find_all
        @stylesheet = 'dashboard'
        @customer = current_customer
        @airline = current_airline
      end

      def determine_user_layout
        "full"
      end

      def find_page
        @show_nav = true
        @page = ::Refinery::Page.where(:link_url => "/airlines").first
      end

    end
  end
end
