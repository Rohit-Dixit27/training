class AddColGenToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :gender, :string
  end
end
