class AddColumnsToSite < ActiveRecord::Migration
  def change
  	add_column :sites, :safe, :int
  	add_column :sites, :injured, :int
  	add_column :sites, :dead, :int
  	add_column :sites, :road_access, :boolean
  	add_column :sites, :nearest_road, :decimal
  end
end
