class AddCompanyIdToSecurities < ActiveRecord::Migration
  def change
  	add_column :securities, :company_id, :integer
  end
end
