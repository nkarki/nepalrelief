class AddQuantityAndStatusToItem < ActiveRecord::Migration
  def change
  	add_column :items, :quantity, :integer
  	add_column :items, :status, :integer
  end
end
