class Dropfinances < ActiveRecord::Migration[7.0]
  def change
    drop_table :finances
  end
end
