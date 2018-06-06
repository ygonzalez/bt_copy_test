class AddCurrentToSecurities < ActiveRecord::Migration
  def change
  	add_column :securities, :current, :boolean, default: true
  end
end
