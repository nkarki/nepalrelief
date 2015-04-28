class CreateNeededItems < ActiveRecord::Migration
  def change
    create_table :needed_items do |t|
      t.string :name
      t.string :type
      t.integer :priority
      t.string :status
      t.integer :quantity
      t.date :expected_date
      t.date :delivered_date

      t.timestamps
    end
  end
end
