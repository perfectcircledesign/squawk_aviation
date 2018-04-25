if @messengers.present?
  json.array!(@messengers) do |messenger|
      json.id messenger.id
  		json.name messenger.name
  		json.image (URI.parse("#{request.protocol}#{request.host_with_port}#{request.fullpath}") + messenger.image.url).to_s 
  		json.last_message messenger.messages.where(:customer_id => @customer.id).order(:created_at).last.message
  		json.last_time "#{time_ago_in_words(messenger.messages.where(:customer_id => @customer.id).order(:created_at).last.created_at)} ago"
  		json.sender_class messenger.messages.where(:customer_id => @customer.id).order(:created_at).last.sender == 'airline-message' ? 'received' : 'sent'
      json.last_unread unread_count(messenger) 
  end
else
  json.response do
    json.code 404
  end
end



