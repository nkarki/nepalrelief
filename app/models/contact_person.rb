class ContactPerson < ActiveRecord::Base
  belongs_to :organization
  belongs_to :site

  def self.show
    ["name", "phone"]
  end

  def self.show_details
    ["name", "phone"]
  end

end
