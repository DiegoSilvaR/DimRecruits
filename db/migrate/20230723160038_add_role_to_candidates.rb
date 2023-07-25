class AddRoleToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :role, :integer, default: 0, null: false
  end
end
