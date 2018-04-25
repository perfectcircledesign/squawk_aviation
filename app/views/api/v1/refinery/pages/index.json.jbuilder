if @pages.present?
  json.array!(@pages) do |page|
    json.extract! page, :id, :title
    json.path 'app.page'
    json.icon 'fa-database'
    json.content page.content_for(:body)
  end
else
  json.response do
    json.code 404
  end
end