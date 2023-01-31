class AddIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :articles,:title
  end
end
