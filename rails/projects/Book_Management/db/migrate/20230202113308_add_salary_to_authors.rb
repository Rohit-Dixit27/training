class AddSalaryToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors,:salary,:decimal, precision:10,scale: 2
  end
end
