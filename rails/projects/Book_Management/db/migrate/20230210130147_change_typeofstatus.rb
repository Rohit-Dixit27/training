class ChangeTypeofstatus < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :status, 'integer using cast(status as integer)'
  end
end
