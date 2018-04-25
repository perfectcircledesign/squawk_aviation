if @user.present? and @user.errors.present?
  json.errors @user.errors.messages
  json.response do
    json.code 422
  end
else
  json.response do
    json.code 201
  end
end
