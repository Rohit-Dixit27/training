class Removeref < ActiveRecord::Migration[7.0]
  def change
    remove_reference :books, :authors
  end
end
