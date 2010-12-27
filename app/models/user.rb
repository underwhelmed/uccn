class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
    
  validates_uniqueness_of :login
  validates_presence_of :login, :first_name, :last_name
  
  attr_accessible :login, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :active, :admin
    
  def name
    if self.display_name.nil?
      self.first_name + ' ' + self.last_name
    else
      self.display_name
    end
  end
end
