class NeededItem < ActiveRecord::Base

  def self.show
    ["name", "priority", "status", "quantity", "expected_date", "delivered_date"]
  end

  def self.show_details
    ["name", "priority", "status", "quantity", "expected_date", "delivered_date"]
  end

end
