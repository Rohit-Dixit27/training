class CreateFinances < ActiveRecord::Migration[7.0]
  def change
    create_table :finances do |t|
      t.timestamps
    end
  end
end
