class AddTitleToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :title, :string, limit: 15, null: true
  end
end
