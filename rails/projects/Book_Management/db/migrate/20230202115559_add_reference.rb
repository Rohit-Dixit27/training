class AddReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :authors, :books, index: false
  end
end
