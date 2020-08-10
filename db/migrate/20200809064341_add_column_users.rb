class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :line_user_id, :string, default: ""
  end
end
