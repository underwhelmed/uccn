class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
    
  validates_uniqueness_of :login
  validates_presence_of :login, :first_name, :last_name 
  validates_date :date_of_birth, :allow_blank => true
  
  attr_accessible :login, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :account_active, :admin, :display_name, :date_of_birth, :business_name, :address1, :address2, :city, :state, :zip_code, :phone_number, :cell_number, :fax_number, :board_member, :board_title, :receive_emails, :include_in_directory, :display_address_in_directory, :display_phone_in_directory, :backup_care  
  
  before_destroy :ensure_an_admin_remains, :ensure_user_is_not_admin
  
  def next_birthday
    year = Date.today.year
    mmdd = date_of_birth.strftime('%m%d')
    year += 1 if mmdd < Date.today.strftime('%m%d')
    mmdd = '0301' if mmdd == '0229' && !Date.parse("#{year}0101").leap?
    Date.parse("#{year}#{mmdd}")
  end
  
  scope :member_directory, lambda {
    where(:account_active => true, :include_in_directory => true)
  }
  
  scope :upcoming_birthdays, lambda {
    member_directory.where("date_of_birth is not null").sort_by(&:next_birthday).first(5)
  }
  
  def active?
    super && (self.account_active? || self.login == 'admin')
  end

  def ensure_user_is_not_admin
    if self.admin?
      raise "Can't delete an Administrator"
    end
  end
  
  def ensure_an_admin_remains
    if User.count(:conditions => {:active => true, :admin => true}) == 0
      raise 'No Administrators remain, cannot delete this user'
    end
  end
  
  def name
     if self.display_name.nil? || self.display_name.blank?
       self.first_name + ' ' + self.last_name       
     else
       self.display_name
     end
   end
end