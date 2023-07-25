class UpdateForeignKeyOnApplications < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :applications, :candidates
    add_foreign_key :applications, :candidates, on_delete: :cascade
  end
end
