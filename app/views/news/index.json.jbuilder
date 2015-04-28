json.array!(@news) do |news|
  json.extract! news, :id, :published, :source, :author, :content
  json.url news_url(news, format: :json)
end
