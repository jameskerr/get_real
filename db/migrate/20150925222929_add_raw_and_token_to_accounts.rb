class AddRawAndTokenToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :raw, :jsonb
    add_column :accounts, :token, :string
    add_index :accounts, :raw, using: :gin
  end
end
