class AddJoinDateToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :join_date, :date
  end
end
