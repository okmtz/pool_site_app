# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :url, null: false
      t.integer :check
      t.string :comment

      t.timestamps
    end
  end
end
