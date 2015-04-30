class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :skillsets
      t.string :location
      t.string :available, default: "true"

      t.timestamps
    end
  end
end
