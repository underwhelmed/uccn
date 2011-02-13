class Comment < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body
  
  attr_accessible :user_id, :body, :conversation_id, :created_at, :updated_at
  
  def start
    self.id == self.conversation.comments.first.id
  end
  
end
