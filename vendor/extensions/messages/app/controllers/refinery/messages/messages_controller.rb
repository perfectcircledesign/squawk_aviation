module Refinery
  module Messages
    class MessagesController < ::ApplicationController

      before_filter :find_all_messages
      before_filter :find_page
      before_filter :check_users
      layout :determine_user_layout


      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @message in the line below:
        present(@page)
      end

      def show
        if current_airline.present?
          @all_message = Message.where("customer_id = ? AND airline_id = ?", params[:id] , current_airline.id).order('created_at ASC')

          Refinery::Messages::Message.where("customer_id = ? AND airline_id = ? AND sender = ?", params[:id], current_airline.id, 'user-message').each { |n| n.update_attribute(:seen, true) }

          @their_avatar = Refinery::Customers::Customer.find_by_id(params[:id])
        elsif current_customer.present?
          @all_message = Message.where("customer_id = ? AND airline_id = ?", current_customer.id , params[:id]).order('created_at ASC')

          Refinery::Messages::Message.where("customer_id = ? AND airline_id = ? AND sender = ?", current_customer.id, params[:id], 'airline-message').each { |n| n.update_attribute(:seen, true) }

          @their_avatar = Refinery::Airlines::Airline.find_by_id(params[:id])
        end
        @message = Refinery::Messages::Message.new
        # @message = Message.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @message in the line below:
        present(@page)
      end

      def new
        @message = Refinery::Messages::Message.new
      end

      def create
        @message = Refinery::Messages::Message.new(params[:message])
        if @message.save!
          respond_to do |format|
            format.js {
              if current_airline.present?
                @all_message = Message.where("customer_id = ? AND airline_id = ?", params[:id] , current_airline.id).order('created_at ASC')
                @their_avatar = Refinery::Customers::Customer.find_by_id(params[:id])
                # if Refinery::Notifications::Notification.valid?(Refinery::Notifications::Notification::AIRLINE_VIEW, current_airline.id, current_airline.class.name, @customer.id, @customer.class.name)
                  Refinery::Notifications::Notification.create!(notification_type: Refinery::Notifications::Notification::AIRLINE_MSG, url: "/messages?msg_click=#{current_airline.id}", sender_id: current_airline.id, sender_class: current_airline.class.name, receiver_id: @their_avatar.id, receiver_class:  @their_avatar.class.name)
                # end
              elsif current_customer.present?
                @all_message = Message.where("customer_id = ? AND airline_id = ?", current_customer.id , params[:id]).order('created_at ASC')
                @their_avatar = Refinery::Airlines::Airline.find_by_id(params[:id])
                Refinery::Notifications::Notification.create!(notification_type: Refinery::Notifications::Notification::PILOT_MSG, url: "/messages?msg_click=#{current_customer.id}", sender_id: current_customer.id, sender_class: current_customer.class.name, receiver_id: @their_avatar.id, receiver_class:  @their_avatar.class.name)
              end
              @message = Refinery::Messages::Message.new
            }
            format.html {
              if current_customer.present?
                Refinery::Notifications::Notification.create!(notification_type: Refinery::Notifications::Notification::PILOT_MSG, url: "/messages?msg_click=#{current_customer.id}", sender_id: current_customer.id, sender_class: current_customer.class.name, receiver_id: @message.airline_id, receiver_class:  'Refinery::Airlines::Airline')
              elsif current_airline.present?
                Refinery::Notifications::Notification.create!(notification_type: Refinery::Notifications::Notification::AIRLINE_MSG, url: "/messages?msg_click=#{current_airline.id}", sender_id: current_airline.id, sender_class: current_airline.class.name, receiver_id: @message.customer_id, receiver_class:  'Refinery::Customers::Customer')
              end
              redirect_to "/messages?msg_click=#{@message.customer_id}"
            }
          end
        end
      end

      def edit

      end

      def update

      end

      def destroy

      end


    protected

      def check_users
        unless current_customer.present? or current_airline.present?
          redirect_to '/'
        end
      end

      def find_all_messages
        if current_customer.present?
          @customer = current_customer
          @messengers = Refinery::Airlines::Airline.eager_load(:messages).where("refinery_messages.customer_id = ?", current_customer.id).order('refinery_messages.created_at DESC')
        elsif current_airline.present?
          @airline = current_airline
          @messengers = Refinery::Customers::Customer.eager_load(:messages).where("refinery_messages.airline_id = ? ", current_airline.id).order('refinery_messages.created_at DESC')
        end
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/messages").first
        @show_nav = true
      end


      def determine_user_layout
        'full'
      end

    end
  end
end
