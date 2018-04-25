if @articles.present?
  json.array!(@articles) do |article|
    json.extract! article, :id, :name, :image_id, :body
  end
else
  json.response do
    json.code 404
  end
end