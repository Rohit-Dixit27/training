class ChangeName < ActiveRecord::Migration[7.0]
  def change
    change_column :books,:desc ,:string,limit: 30
  end
end
