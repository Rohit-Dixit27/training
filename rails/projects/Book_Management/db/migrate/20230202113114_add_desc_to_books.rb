class AddDescToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :desc, :string, limit: 20
  end
end
