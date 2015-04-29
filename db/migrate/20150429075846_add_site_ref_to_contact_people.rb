class AddSiteRefToContactPeople < ActiveRecord::Migration
  def change
    add_reference :contact_people, :site, index: true
  end
end
