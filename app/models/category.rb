class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates_presence_of :name, :slug
  attr_accessible :id, :name, :slug
  
  before_validation :create_slug
  
  def create_slug
    str = self.name
    str = str.gsub(/[^a-zA-Z0-9 ]/,"").downcase
    str = str.gsub(/[ ]+/," ")
    str = str.gsub(/ /,"-")
    self.slug = str
  end
  
end
