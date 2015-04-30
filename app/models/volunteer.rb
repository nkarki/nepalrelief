class Volunteer < ActiveRecord::Base
  scope :available, -> { where(available: "true")}
  
  def self.show
    ["name", "skillsets", "location", "available"]
  end

  def self.show_details
    ["name", "phone", "email", "skillsets", "location", "available"]
  end
end
