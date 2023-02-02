class AddForeignkey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :books,:authors
  end
end
