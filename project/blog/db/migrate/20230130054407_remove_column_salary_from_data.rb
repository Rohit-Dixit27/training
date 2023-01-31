class RemoveColumnSalaryFromData < ActiveRecord::Migration[7.0]
  def change
    remove_column :data,:salary
  end
end
