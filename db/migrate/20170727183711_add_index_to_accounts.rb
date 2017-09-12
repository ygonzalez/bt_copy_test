class AddIndexToAccounts < ActiveRecord::Migration
  def change
  	add_index :accounts, :acctid, unique: true
  end
end
