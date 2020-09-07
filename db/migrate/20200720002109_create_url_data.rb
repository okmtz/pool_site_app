# frozen_string_literal: true

class CreateUrlData < ActiveRecord::Migration[6.0]
  def change
    create_table :url_data do |t|
      t.string :title, null: false, default: ''
      t.text :favicon, null: false, default: ''
      t.text :description, null: false, default: ''
      t.text :image, null: false, default: ''
      t.timestamps
    end
  end
end
