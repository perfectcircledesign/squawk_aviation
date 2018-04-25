class Api::V1::Refinery::NotificationsController < Api::V1::BaseController
  respond_to :json

  def index
  	if params[:customer_id].present?
  		@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
			if @customer.present?
				@notifications = @customer.notifications
			end
  	end
  end

  def count
  	@customer = Refinery::Customers::Customer.find_by_id(params[:customer_id])
  	@unread_message_count = Refinery::Messages::Message.where('customer_id = ? AND sender = ? AND seen = ?', @customer.id, 'airline-message', false).count
  	@notification_count = Refinery::Notifications::Notification.where('receiver_id = ? AND receiver_class = ? AND id > ?', @customer.id, 'Refinery::Customers::Customer', @customer.last_notification_id.present? ? @customer.last_notification_id : 0).count 
  end

end