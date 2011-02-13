class Conversation < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates_presence_of :title
  
  attr_accessible :id, :title, :user_id, :views, :created_at, :updated_at
  
  validates_length_of :title, :maximum=> 255
end
