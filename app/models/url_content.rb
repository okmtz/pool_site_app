class UrlContent < ApplicationRecord
  belongs_to :article

  class << self

    def create(article)
      url_content = url_content_params(article)

      begin
        UrlContent.create!(url_content)
      rescue => exception
        puts "保存に失敗しました"
      end
    end

    def update(article)
      url_content = UrlContent.where(article_id: article.id)

      begin
        url_content.update!(url_content_params)
      rescue => exception
        puts "保存に失敗しました"
      end
    end

    private

    def url_content_params(article)
      url_content = LinkThumbnailer.generate(article.url)
      title = url_content.title ? url_content.title : ''
      # faviconがimageタグで表示できない
      favicon = url_content.favicon ? url_content.favicon : ''
      description = url_content.description ? url_content.description : ''
      image = url_content.images.first ? url_content.images.first.src.to_s : '' 
      data = {title: title, favicon: favicon, description: description, image: image, article_id: article.id}

      return data
    end
  end
end
