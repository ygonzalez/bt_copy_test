class CreateSecurities < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :name
      t.decimal :market_value
      t.string :cusip
      t.string :ticker
      t.integer :account_id
      t.timestamps
    end
  end
end
