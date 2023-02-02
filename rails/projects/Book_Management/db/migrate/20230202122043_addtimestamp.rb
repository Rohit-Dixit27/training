class Addtimestamp < ActiveRecord::Migration[7.0]
  def change
    add_timestamps :management_table
  end
end
