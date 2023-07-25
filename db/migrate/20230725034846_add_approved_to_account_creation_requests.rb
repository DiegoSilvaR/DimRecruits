class AddApprovedToAccountCreationRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :account_creation_requests, :approved, :boolean
  end
end
