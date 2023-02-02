class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :books,:authors,on_delete: :cascade
  end
end
