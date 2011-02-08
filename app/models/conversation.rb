class Conversation < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates_presence_of :title
  
  validates_length_of :title, :maximum=> 255
end
