class Changedefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :books, :title, 'new title'
  end
end
