class Site < ActiveRecord::Base

  def self.show
    ["name", "zone", "district", "severity", "population"]
  end

  def self.show_details
    ["name", "zone", "district", "severity", "population"]
  end

end
