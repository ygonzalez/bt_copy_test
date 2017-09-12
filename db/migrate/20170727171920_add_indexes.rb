class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :managers, :name, unique: true
  end
end
