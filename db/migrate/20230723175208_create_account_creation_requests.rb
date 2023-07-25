class CreateAccountCreationRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :account_creation_requests do |t|
      t.string :name
      t.string :email
      t.string :experience
      t.string :skills
      t.decimal :salary_expectation
      t.string :professional_title
      t.text :message
      t.string :status

      t.timestamps
    end
  end
end
