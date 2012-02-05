class Album < ActiveRecord::Base
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  
  validates_presence_of :name, :description, :slug
  validates_inclusion_of :public, :in => [true, false]
  validates :pictures, :length => {:minimum => 1, :message => 'must have at least one (1) photo'}
  attr_accessible :name, :description, :public, :pictures_attributes
  
  before_validation :add_slug
  
  private 
  
    def add_slug
      self.slug = create_slug(self.name) if !self.name.nil?
    end
  
    def create_slug(str)
      #a slug is a URL-safe string that echoes the title
      #in this method we want to remove any weird punctuation and spaces
      str = str.gsub(/[^a-zA-Z0-9 ]/,"").downcase
      str = str.gsub(/[ ]+/," ")
      str.gsub(/ /,"-")      
    end
end
