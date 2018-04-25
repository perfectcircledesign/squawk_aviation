if @messages.present?
  json.array!(@messages) do |message|
    json.sender_class message.sender == 'airline-message' ? 'received' : 'sent'    
    json.time time_ago_in_words(message.created_at) 
    json.message message.message
  end
else
  json.response do
    json.code 404
  end
end



