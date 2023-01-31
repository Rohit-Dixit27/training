class DropTableData < ActiveRecord::Migration[7.0]
  def change
    drop_table :data
  end
end
