class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates_presence_of :name
  attr_accessible :name, :slug
  
  def create_slug(str)
    str = str.gsub(/[^a-zA-Z0-9 ]/,"").downcase
    str = str.gsub(/[ ]+/," ")
    str = str.gsub(/ /,"-")
    str
  end
  
end
