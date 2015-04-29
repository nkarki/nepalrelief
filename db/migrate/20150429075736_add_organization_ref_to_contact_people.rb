class AddOrganizationRefToContactPeople < ActiveRecord::Migration
  def change
    add_reference :contact_people, :organization, index: true
  end
end
