class Comment < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body
  
  attr_accessible :created_at, :updated_at
  
  def start
    self.id == self.conversation.comments.first.id
  end
  
end
