class CreateLineLinkNonces < ActiveRecord::Migration[6.0]
  def change
    create_table :line_link_nonces do |t|
      t.references :user, null: false, foreign_key: true
      t.string :nonce, null: false, default: ""
      t.timestamps
    end
  end
end
