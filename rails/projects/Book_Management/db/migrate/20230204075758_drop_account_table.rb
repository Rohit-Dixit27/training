class DropAccountTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :account_tables
  end
end
