class AddColumnToAccountHistory < ActiveRecord::Migration[7.0]
  def change
    add_column :account_histories, :account_id, :bigint
  end
end
