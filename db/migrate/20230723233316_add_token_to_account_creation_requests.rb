class AddTokenToAccountCreationRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :account_creation_requests, :token, :string
    add_index :account_creation_requests, :token
  end
end
