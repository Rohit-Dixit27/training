class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :accounts, :suppliers, column: :supplier_id, on_delete: :cascade
    add_foreign_key :account_histories, :accounts, column: :account_id, on_delete: :cascade
  end
end
