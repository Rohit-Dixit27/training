class DropJoinTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :articles_authors
  end
end
