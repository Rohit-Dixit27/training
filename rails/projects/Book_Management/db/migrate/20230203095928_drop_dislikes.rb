class DropDislikes < ActiveRecord::Migration[7.0]
  def change
    drop_table :dislikes_tables
  end
end
