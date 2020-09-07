# frozen_string_literal: true

class AddColumnArticleIdToUrlContents < ActiveRecord::Migration[6.0]
  def change
    add_reference :url_contents, :article, null: false, foreign_key: true
  end
end
