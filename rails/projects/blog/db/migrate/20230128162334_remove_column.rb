class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles,:authors_id,:int
  end
end
