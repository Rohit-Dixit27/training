class AddaTitleToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books,:title,:string,comment:"this is title"
  end
end
