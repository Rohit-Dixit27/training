class AddResigningDateToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :resign_date, :date
  end
end
