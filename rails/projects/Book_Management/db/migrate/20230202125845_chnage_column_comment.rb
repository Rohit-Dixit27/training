class ChnageColumnComment < ActiveRecord::Migration[7.0]
  def change
    change_column_comment :books, :title, from: "this is title", to: "enter title only"
  end
end
