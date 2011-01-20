class Post < ActiveRecord::Base
  cattr_reader :per_page

  validates_presence_of :title

  attr_accessible :title, :members_only, :published, :published_at
  
  validate :determine_valid_post

  def pretty_date
    published_at.strftime("%A, %B %d, %Y")
  end
  
  def determine_valid_post
    
  end
    
end
