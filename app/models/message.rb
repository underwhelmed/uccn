class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :body
  attr_accessible :name, :email, :phone, :body
end
