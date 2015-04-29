class Organization < ActiveRecord::Base
  has_many :items
  has_many :contact_persons

  def self.show
    ["name","zone", "district", "city"]
  end

  def self.show_details
    ["name","zone", "district", "city", "address_1", "address_2"]
  end

end
