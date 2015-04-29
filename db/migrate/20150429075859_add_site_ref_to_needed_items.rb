class AddSiteRefToNeededItems < ActiveRecord::Migration
  def change
    add_reference :needed_items, :site, index: true
  end
end
