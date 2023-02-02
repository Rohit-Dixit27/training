class CreateEnglishBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :english_books do |t|

      t.timestamps
    end
  end
end
