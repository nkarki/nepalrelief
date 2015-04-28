class Organization < ActiveRecord::Base

  def self.show
    ["name","location","phone"]
  end

  def self.show_details
    ["name","location","phone"]
  end

end
