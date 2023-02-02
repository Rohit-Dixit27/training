class CreateLikeTable < ActiveRecord::Migration[7.0]
  def up
    create_table :like_tables do |t|

      t.timestamps
    end
  end
  def down
    drop_table :like_tables
  end
end
