json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :description, :copy, :photo, :print
  json.url article_url(article, format: :json)
end
