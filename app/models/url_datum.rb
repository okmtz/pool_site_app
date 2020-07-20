class UrlDatum < ApplicationRecord
  belongs_to :articleexit

  class << self
    def url_datum_params(article)
      url_datum = LinkThumbnailer.generate(article.url)
      data = {title: url_datum.title, favicon: url_datum.favicon, description: url_datum.description, image: url_datum.images.first.src.to_s, article_id: article.id}
    end

    def create(article)
      url_datum = url_datum_params(article)

      begin
        UrlDatum.create!(url_datum)
      rescue => exception
        puts "保存に失敗しました"
      end
    end

    def update(article)
      url_datum = UrlDatum.where(article_id: article.id)

      begin
        url_datum.update!(url_datum_params)
      rescue => exception
        puts "保存に失敗しました"
      end
    end
  end
end
