class AddSharesToSecurities < ActiveRecord::Migration
  def change
  	add_column :securities, :shares, :integer
  end
end
