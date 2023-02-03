class CreateAccountTable < ActiveRecord::Migration[7.0]
  def change
    create_table :account_tables do |t|
      t.timestamps
    end
  end
end
