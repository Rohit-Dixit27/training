class RemoveForeignk < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :books, :authors
  end
end
