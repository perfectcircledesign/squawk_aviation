module Refinery
  module Jobs
    class JobsController < ::ApplicationController

      before_filter :find_all_jobs
      before_filter :find_page, :only_customer_airline
      layout :determine_user_layout

      # before_filter :authenticate_customer!, :only => [:index, :show, :favourite_job]
      before_filter :airline_account, :only => [:new, :create, :edit, :update, :destroy]

      def airline_account
        unless airline_signed_in?
          redirect_to '/airlines/sign_in'
        else
          @airline = current_airline
        end
      end

      def only_customer_airline
        unless current_customer.present? or current_airline.present? or current_user.present?
          redirect_to '/'
        end
      end

      def index
        redirect_to '/'
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @job in the line below:
        present(@page)
      end

      def show
        @customer = current_customer

        @job = Job.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @job in the line below:
        present(@page)
      end

      def favourite_job
        if current_customer.present? and params[:job_id].present?
          favourite = Favourite.where("customer_id = ? AND job_id = ? AND who_favourite = ?", current_customer.id , params[:job_id], 'pilot').first
          if favourite.present?
            favourite.destroy
          else
            Favourite.create(:job_id => params[:job_id], :customer_id => current_customer.id, :who_favourite => 'pilot')

            job = Job.find(params[:job_id])
            if Refinery::Notifications::Notification.valid?(Refinery::Notifications::Notification::PILOT_JOB, @customer.id, @customer.class.name, job.airline.id, job.airline.class.name)
              Refinery::Notifications::Notification.create!(notification_type: Refinery::Notifications::Notification::PILOT_JOB, url: "/customers/#{current_customer.id}", sender_id: current_customer.id, sender_class: current_customer.class.name, receiver_id: job.airline.id, receiver_class:  job.airline.class.name)
            end

          end
        end
      end


      def search

        present(@page)
      end

      def new
        @job = Refinery::Jobs::Job.new
        # @method_type = :post
      end

      def create
        @job = Refinery::Jobs::Job.new(params[:job])
        if @job.save!         
          redirect_to '/airline_jobs'
        end
      end

      def edit
        @job = Job.find(params[:id])
        # @method_type = :put
      end

      def update
        @job = Job.find(params[:id])
        if @job.errors.empty?
          @job.update_attributes(params[:job])
          redirect_to '/airline_jobs'
        end
      end

      def destroy
        item = Refinery::Jobs::Job.find(params[:id])
        item.destroy

        redirect_to '/airline_jobs'
      end

    protected

      def determine_user_layout
        'full'
      end

      def find_all_jobs
        @jobs = Job.order('position ASC')
      end

      def find_page
        @show_nav = true
        @page = ::Refinery::Page.where(:link_url => "/jobs").first
      end

    end
  end
end
