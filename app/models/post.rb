class Post < ActiveRecord::Base
  cattr_reader :per_page

  validates_presence_of :title

  attr_accessible :title, :members_only, :published, :published_at
  
  validate :determine_valid_post

  def pretty_date
    published_at.strftime("%A, %B %d, %Y")
  end
  
  def create_slug(str)
    #a slug is a URL-safe string that echoes the title
    #in this method we want to remove any weird punctuation and spaces
    str = str.gsub(/[^a-zA-Z0-9 ]/,"").downcase
    str = str.gsub(/[ ]+/," ")
    str = str.gsub(/ /,"-")
    str
  end
  
  def year
    published_at.year.to_s
  end
  
  def month
    sprintf("%.2d",published_at.month)    
  end
  
  def day
    sprintf("%.2d",published_at.day)
  end
  
  def url
    "/#{year}/#{month}/#{day}/#{slug}"
  end
  
  def determine_valid_post
    
  end
    
end
