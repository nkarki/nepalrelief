class News < ActiveRecord::Base

  def self.show
    ["source", "author", "published_at"]
  end

  def self.show_details
    ["source", "author", "published_at"]
  end

end
