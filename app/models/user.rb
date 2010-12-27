class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
    
  validates_uniqueness_of :login
  validates_presence_of :login, :first_name, :last_name
  
  attr_accessible :login, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :active, :admin
  
  before_save :default_values  
  before_destroy :ensure_an_admin_remains

  def ensure_user_is_not_admin
    if self.admin?
      raise "Can't delete an Administrator"
    end
  end
  
  def default_values
    self.active = true unless !self.active.nil?
    self.admin = false unless !self.admin.nil?
  end
 
  def name
    if self.display_name.nil?
      self.first_name + ' ' + self.last_name
    else
      self.display_name
    end
  end
end
