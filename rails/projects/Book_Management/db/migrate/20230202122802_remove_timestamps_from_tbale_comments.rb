class RemoveTimestampsFromTbaleComments < ActiveRecord::Migration[7.0]
  def change
    remove_timestamps :table_comments
  end
end
