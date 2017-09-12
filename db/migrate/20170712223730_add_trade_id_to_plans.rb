class AddTradeIdToPlans < ActiveRecord::Migration
  def change
  	add_column :plans, :trade_id, :integer
  end
end
