class AddColumnToUserLineIds < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_line_ids, :user, null: false, foreign_key: true
  end
end
