# frozen_string_literal: true

class UrlContent < ApplicationRecord
  belongs_to :article

  class << self
    def create(article)
      article_content = fetch_url_data(article)
      url_content = url_content_params(article_content, article.id)
      UrlContent.create!(url_content)
    end

    def update(article)
      # whereで検索するとupdate!がno method errorになる
      url_content_old = UrlContent.find_by(article_id: article.id)
      article_content = fetch_url_data(article)
      url_content = url_content_params(article_content, article.id)
      url_content_old.update!(url_content)
    end

    private

    def fetch_url_data(article)
      url_content = LinkThumbnailer.generate(article.url)
      url_content
    end

    def url_content_params(article_content, article_id)
      title = article_content.title || ''
      # faviconがimageタグで表示できない
      favicon = article_content.favicon || ''
      description = article_content.description || ''
      image = article_content.images.first ? article_content.images.first.src.to_s : ''
      data = { title: title, favicon: favicon, description: description, image: image, article_id: article_id }

      data
    end
  end
end
