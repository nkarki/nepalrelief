class Site < ActiveRecord::Base
  has_many :contact_people
  has_many :needed_items

  def self.show
    ["name", "zone", "district", "severity", "population"]
  end

  def self.show_details
    ["name", "zone", "district", "severity", "population"]
  end

end
