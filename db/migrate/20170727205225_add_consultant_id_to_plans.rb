class AddConsultantIdToPlans < ActiveRecord::Migration
  def change
  	add_column :plans, :consultant_id, :integer
  end
end
