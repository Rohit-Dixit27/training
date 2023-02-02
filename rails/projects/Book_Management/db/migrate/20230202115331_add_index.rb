class AddIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :authors,:name,if_not_exists: true
  end
end
