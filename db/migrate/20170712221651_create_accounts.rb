class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :market_value
      t.integer :manager_id
      t.integer :plan_id
      t.string :acctid
      t.decimal :committed
      t.string :asset_class
      t.timestamps
    end
  end
end
