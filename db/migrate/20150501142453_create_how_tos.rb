class CreateHowTos < ActiveRecord::Migration
  def change
    create_table :how_tos do |t|

      t.timestamps
    end
  end
end
