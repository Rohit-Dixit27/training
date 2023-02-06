class AddColumnToAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :supplier_id, :bigint
  end
end
