class AddColumntoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :count, :integer
  end
end
