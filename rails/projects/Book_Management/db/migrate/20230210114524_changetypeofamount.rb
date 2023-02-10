class Changetypeofamount < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :amount, 'integer USING CAST(amount AS integer)'
  end
end
