class ChangeUrlDataToUrlContents < ActiveRecord::Migration[6.0]
  def change
    rename_table :url_data, :url_contents
  end
end
