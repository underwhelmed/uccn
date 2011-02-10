class Post < ActiveRecord::Base
  cattr_reader :per_page
  
  has_and_belongs_to_many :categories

  validates_presence_of :title

  attr_accessible :title, :excerpt, :body, :members_only, :status, :published_at, :category_ids
  
  before_validation :add_slug
  validate :determine_valid_post
  
  scope :published, lambda { 
    published_for_members.where("posts.members_only = 0")
  }
  
  scope :published_for_members, lambda {
    where("posts.status = 2 and posts.published_at IS NOT NULL AND posts.published_at <= ?", Time.zone.now)
  }

  def has_categories
    self.categories.count > 0
  end
  
  def has_category(category)
    self.categories.exists(category.id)
  end
   
  def pretty_date
    published_at.strftime("%A, %B %d, %Y %l:%M %p") if !published_at.nil?
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
    "/blog/#{year}/#{month}/#{day}/#{slug}"
  end
  
  private
    def determine_valid_post
      errors[:base] = "A published post needs to have a body" if self.status == 2 && (self.body.nil? || self.body.length == 0)
      errors[:base] = "A published post needs to have a published date" if self.status == 2 && (self.published_at.nil?)
      errors[:base] = "A published post needs to have an author" if self.status == 2 && self.author.nil?
    end  
    
    def add_slug
      self.slug = create_slug(self.title) if !self.title.nil? && self.status == 2
    end  
end
