class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :name
      t.string :name_short
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
