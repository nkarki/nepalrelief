class ChangeAddressAndPhoneFieldsToOrganization < ActiveRecord::Migration
  def change
  	remove_column :organizations, :phone
  	remove_column :organizations, :location
  	add_column :organizations, :zone, :string
  	add_column :organizations, :district, :string
  	add_column :organizations, :address1, :string
  	add_column :organizations, :address2, :string
  	add_column :organizations, :zip, :string
  	add_column :organizations, :latitude, :string
  	add_column :organizations, :longitude, :string
  end
end
