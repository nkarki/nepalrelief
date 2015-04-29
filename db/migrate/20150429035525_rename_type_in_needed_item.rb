class RenameTypeInNeededItem < ActiveRecord::Migration
  def change
    rename_column :needed_items, :type, :needed_item_type
  end
end
