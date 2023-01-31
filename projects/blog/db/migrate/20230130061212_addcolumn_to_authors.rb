class AddcolumnToAuthors < ActiveRecord::Migration[7.0]
  def up
    add_column :authors,:salary,:string
  end

  def down
    remove_column :authors,:salary
  end
end
