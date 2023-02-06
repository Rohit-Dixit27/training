class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :authors_id, :bigint
  end
end
