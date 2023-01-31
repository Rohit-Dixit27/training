class RenameColumnFromArticle < ActiveRecord::Migration[7.0]
  def change
    rename_column :articles , :desc ,:Description
  end
end
