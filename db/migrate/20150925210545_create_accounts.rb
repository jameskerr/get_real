class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :identifier
      t.integer :service

      t.timestamps null: false
    end
  end
end
