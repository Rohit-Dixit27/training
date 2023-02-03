class RenameColumnFromBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :desc, :description
  end
end
