class ChangeLatLongToDecimal < ActiveRecord::Migration
  def change
  	change_column :organizations, :latitude, :decimal
  	change_column :organizations, :longitude, :decimal
  	change_column :sites, :longitude, :decimal
  	change_column :sites, :latitude, :decimal
  end
end
