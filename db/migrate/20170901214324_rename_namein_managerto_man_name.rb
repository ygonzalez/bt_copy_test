class RenameNameinManagertoManName < ActiveRecord::Migration
  def change
  	rename_column :managers, :name, :man_name
  end
end




