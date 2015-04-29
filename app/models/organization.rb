class Organization < ActiveRecord::Base
  has_many :items
  has_many :contact_persons

  def self.show
    ["name","zone", "district"]
  end

  def self.show_details
    ["name","zone", "district"]
  end

end
