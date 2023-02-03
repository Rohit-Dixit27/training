class SalaryToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :salary, :integer, if_not_exists: true
  end
end
