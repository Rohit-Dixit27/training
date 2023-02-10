class AddReferencetoorders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :book, foreign_key: true
  end
end
