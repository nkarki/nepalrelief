class NeededItem < ActiveRecord::Base
  belongs_to :site
  	
  def self.show
    ["name", "priority", "status", "quantity", "expected_date", "delivered_date"]
  end

  def self.show_details
    ["name", "priority", "status", "quantity", "expected_date", "delivered_date"]
  end

end
