class CreateTableCommnets < ActiveRecord::Migration[7.0]
  def change
    create_table :table_commnets do |t|
      t.string :comments

      t.timestamps
    end
  end
end
