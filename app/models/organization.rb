class Organization < ActiveRecord::Base
  has_many :items
  has_many :contact_persons

  def self.show
    ["name","location","phone"]
  end

  def self.show_details
    ["name","location","phone"]
  end

end
