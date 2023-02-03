class CreateTableComment < ActiveRecord::Migration[7.0]
  def change
    create_table :table_comments do |t|
      t.string :name
      t.timestamps
    end
  end
end
