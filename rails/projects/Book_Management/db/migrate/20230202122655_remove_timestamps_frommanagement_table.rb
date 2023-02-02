class RemoveTimestampsFrommanagementTable < ActiveRecord::Migration[7.0]
  def change
    remove_timestamps :management_table
  end
end
