class AddColToFinance < ActiveRecord::Migration[7.0]
  def change
    add_column :finances, :name, :string
  end
end
