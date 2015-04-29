class ContactPerson < ActiveRecord::Base

  def self.show
    ["name", "phone"]
  end

  def self.show_details
    ["name", "phone"]
  end

end
