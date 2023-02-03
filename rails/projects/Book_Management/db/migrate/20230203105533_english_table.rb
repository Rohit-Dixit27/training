class EnglishTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :english_books
  end
end
