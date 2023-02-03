class CreateDislikesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :dislikes_tables do |t|
      t.timestamps
    end
  end
end
