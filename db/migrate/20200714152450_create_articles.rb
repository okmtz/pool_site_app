class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :url
      t.integer :check
      t.string :comment

      t.timestamps
    end
  end
end
