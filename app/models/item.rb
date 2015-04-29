class Item < ActiveRecord::Base
  belongs_to :organization	
  def self.show
    ["name", "item_type", "created_at"]
  end

  def self.show_details
    ["name", "item_type", "created_at", "updated_at"]
  end

end
