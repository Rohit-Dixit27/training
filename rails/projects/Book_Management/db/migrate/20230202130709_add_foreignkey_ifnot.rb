class AddForeignkeyIfnot < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :books,:authors,if_not_exists: true
  end
end
