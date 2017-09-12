class AddAssetClassIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :asset_class_id, :integer
  end
end
