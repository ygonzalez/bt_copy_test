class AddCustodianIdToPlans < ActiveRecord::Migration
  def change
  	add_column :plans, :custodian_id, :integer
  end
end
