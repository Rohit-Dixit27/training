class AddAmountToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :amount, :string
  end
end
