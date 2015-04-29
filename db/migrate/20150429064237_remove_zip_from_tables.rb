class RemoveZipFromTables < ActiveRecord::Migration
  def change
  	remove_column :organizations, :zip
  	remove_column :sites, :zip
  end
end
