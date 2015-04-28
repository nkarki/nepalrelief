class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :zone
      t.string :district
      t.string :address1
      t.string :address2
      t.integer :zip
      t.float :latitude
      t.float :longitude
      t.integer :severity
      t.integer :population

      t.timestamps
    end
  end
end
