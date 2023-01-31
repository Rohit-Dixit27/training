class DropTablecomments < ActiveRecord::Migration[7.0]
  def change
    drop_table :table_commnets
  end
end
