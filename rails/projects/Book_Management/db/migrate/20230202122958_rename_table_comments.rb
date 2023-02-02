class RenameTableComments < ActiveRecord::Migration[7.0]
  def change
    rename_table :table_comments,:comments
  end
end
