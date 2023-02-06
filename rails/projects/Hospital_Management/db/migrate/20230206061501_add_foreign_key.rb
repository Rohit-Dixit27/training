class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :appointments, :patients, column: :patient_id, primary_key: "id", on_delete: :cascade
    add_foreign_key :appointments, :physicians, column: :physician_id, primary_key: "id", on_delete: :cascade
  end
end
