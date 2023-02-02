class RevertingMigration < ActiveRecord::Migration[7.0]
  def change
    revert CreateLikeTable
  end
end
