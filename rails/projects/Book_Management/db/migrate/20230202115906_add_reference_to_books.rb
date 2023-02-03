class AddReferenceToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :authors, index: false
  end
end
