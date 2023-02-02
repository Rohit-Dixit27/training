class AddAdressToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :address, :string
  end
end
