class RenameTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :articles,:Blogdata
  end
end
