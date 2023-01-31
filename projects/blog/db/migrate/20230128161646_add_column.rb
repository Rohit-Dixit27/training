class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :articles,:author_id,:int
  end
end
