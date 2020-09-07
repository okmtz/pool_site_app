# frozen_string_literal: true

class AddColumnToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user, null: false, foreign_key: true
  end
end
