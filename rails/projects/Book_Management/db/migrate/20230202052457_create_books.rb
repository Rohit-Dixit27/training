class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :author_id, foreign_key: true
      t.timestamps
    end
  end
end
