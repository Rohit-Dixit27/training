class RemoveIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :authors, :name
  end
end
