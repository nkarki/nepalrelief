class AddOrganizationRefToItems < ActiveRecord::Migration
  def change
    add_reference :items, :organization, index: true
  end
end
