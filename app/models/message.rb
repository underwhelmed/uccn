class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  attr_accessible :name, :email, :phone, :message
end
