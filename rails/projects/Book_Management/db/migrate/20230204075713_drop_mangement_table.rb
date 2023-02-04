class DropMangementTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :management_table
  end
end
