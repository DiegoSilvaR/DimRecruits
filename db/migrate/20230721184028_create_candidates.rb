class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.text :experience
      t.text :skills
      t.decimal :salary_expectation
      t.string :professional_title
      t.references :candidate, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
