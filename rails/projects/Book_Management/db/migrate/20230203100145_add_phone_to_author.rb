class AddPhoneToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :contact, :string
  end
end
