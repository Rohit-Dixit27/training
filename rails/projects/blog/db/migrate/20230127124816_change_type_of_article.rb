class ChangeTypeOfArticle < ActiveRecord::Migration[7.0]
  def change
    change_column :articles,:Description,:text
  end
end
