module Refinery
  module Notifications
    class NotificationsController < ::ApplicationController

      before_filter :find_all_notifications
      before_filter :find_page, :check_user
      layout :determine_user_layout

      def check_user
        unless current_airline.present? or current_customer.present?
          redirect_to '/'
        end

        if current_airline.present?
          @airline = current_airline
          @notifications = @airline.notifications.order('created_at DESC')
        end

        if current_customer.present?
          @customer = current_customer
          @notifications = @customer.notifications.order('created_at DESC')
        end
        @show_nav = true
      end


      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @notification in the line below:
        present(@page)
      end

      def show
        @notification = Notification.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @notification in the line below:
        present(@page)
      end

      def mark_seen
        @notification = Notification.find(params[:id])
        @notification.seen!
        redirect_to @notification.url
      end

      def set_last_notification
        if current_airline.present?
          item = Notification.where("sender_class = ? AND receiver_id = ? AND receiver_class = ?", 'Refinery::Customers::Customer', current_airline.id , current_airline.class.name).order('created_at ASC').last
          current_airline.last_notification_id = item.id
          current_airline.save!
        elsif current_customer.present?
          item = Notification.where("sender_class = ? AND receiver_id = ? AND receiver_class = ?", 'Refinery::Airlines::Airline', current_customer.id , current_customer.class.name).order('created_at ASC').last
          current_customer.last_notification_id = item.id
          current_customer.save!
        end
      end

    protected

      def determine_user_layout
        'full'
      end

      def find_all_notifications
        @notifications = Notification.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/notifications").first
      end

    end
  end
end
