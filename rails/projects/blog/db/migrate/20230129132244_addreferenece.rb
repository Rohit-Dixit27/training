class Addreferenece < ActiveRecord::Migration[7.0]
  def change
    add_reference :articles,:authors
  end
end
