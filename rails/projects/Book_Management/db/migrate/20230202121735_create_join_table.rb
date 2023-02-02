class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :authors,:books,table_name: :management_table
  end
end
