json.extract! article, :id, :url, :check, :comment, :created_at, :updated_at
json.url article_url(article, format: :json)
