class CreateInfoTable < ActiveRecord::Migration[7.0]
  def change
    create_table :info_tables do |t|
      t.date :date

      t.timestamps
    end
  end
end
