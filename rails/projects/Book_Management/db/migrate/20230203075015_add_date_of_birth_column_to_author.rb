class AddDateOfBirthColumnToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :date_of_birth, :date
  end
end
