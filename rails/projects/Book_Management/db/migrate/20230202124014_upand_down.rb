class UpandDown < ActiveRecord::Migration[7.0]
  def up
    add_column :dislikes_tables, :yes, :string
  end
  def down
    remove_column :dislikes_tables, :yes, :string
  end
end
