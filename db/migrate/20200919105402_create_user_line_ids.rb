class CreateUserLineIds < ActiveRecord::Migration[6.0]
  def change
    create_table :user_line_ids do |t|
      t.string :line_user_id
      t.timestamps
    end
  end
end
