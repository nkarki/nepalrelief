class AddApprovedColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :approved, :boolean
    add_index  :users, :approved
  end
end
