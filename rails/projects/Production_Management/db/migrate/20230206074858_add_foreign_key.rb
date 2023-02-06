class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :assemblies_parts, :assemblies, column: :assembly_id, on_delete: :cascade
    add_foreign_key :assemblies_parts, :parts, column: :part_id, on_delete: :cascade
  end
end
