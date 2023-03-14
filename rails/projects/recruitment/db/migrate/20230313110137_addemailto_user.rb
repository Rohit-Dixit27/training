class AddemailtoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null:false
    add_column :users, :mobile, :string, null:false
    add_column :users, :branch, :string, null:false
    add_column :users, :cgpa, :string, null:false

    
  end
end
