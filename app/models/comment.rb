class Comment < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  validates_presence_of :body
  
  def start
    self.id == self.conversation.comments.first.id
  end
  
end
