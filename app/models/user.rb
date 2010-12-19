class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :login, :first_name, :last_name
  
  attr_accessible :login, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  
end
