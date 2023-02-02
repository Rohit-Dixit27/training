class ChangeTitle < ActiveRecord::Migration[7.0]
  def change
    change_column :books,:title,:string,limit: 20,null: true,default: "enter title"
  end
end
