if @notifications.present?
  json.array!(@notifications) do |notification|
		json.notification_type notification.notification_type
		json.url notification.url
		json.receiver_id notification.receiver_id
		json.receiver_class notification.receiver_class
		json.sender_id notification.sender_id
		json.sender_class notification.sender_class
		json.seen notification.seen
		json.message notification.message
		json.time "#{time_ago_in_words(notification.created_at)} ago"
		json.sender do
			json.image (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + notification.sender.image.url).to_s 
		end
		json.object notification.object
		json.app_path notification.app_path
  end
else
  json.response do
    json.code 404
  end
end







