class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :photo, 
                    :storage => :s3, 
                    :s3_credentials => S3_CREDENTIALS,
                    :bucket => "uccnws-" + Rails.env,
                    :path => ":id/:style/:filename",
                    :styles => { :original => '400x400>', :thumb => '72x72'}
 
  validates_uniqueness_of :login
  validates_presence_of :login, :first_name, :last_name 
  validates_date :date_of_birth, :allow_blank => true
  
  validates_attachment_size :photo, :less_than => 7.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  attr_accessible :id, :login, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :account_active, :admin, :display_name, :date_of_birth, :business_name, :address1, :address2, :city, :state, :zip_code, :phone_number, :cell_number, :fax_number, :board_member, :board_title, :receive_emails, :include_in_directory, :display_address_in_directory, :display_phone_in_directory, :backup_care, :created_at, :updated_at, :photo, :biography, :delete_photo, :notify_on_new_post
  
  def delete_photo=(value)
    @delete_photo = !value.to_i.zero?
  end

  def delete_photo
    !!@delete_photo
  end
  
  alias_method :delete_photo?, :delete_photo

  before_validation :clear_photo  
  def clear_photo
    self.photo.clear if delete_photo? && !photo.dirty?
  end
  
  before_destroy :ensure_an_admin_remains, :ensure_user_is_not_admin
  
  def next_birthday
    dt = 9.days.ago
    year = dt.year
    mmdd = date_of_birth.strftime('%m%d')
    year += 1 if mmdd < dt.strftime('%m%d')
    mmdd = '0301' if mmdd == '0229' && !Date.parse("#{year}0101").leap?
    Date.parse("#{year}#{mmdd}")
  end
  
  scope :active_members, lambda {
    where(["users.account_active = ?", true]).order('users.login')
  }
  
  scope :board, lambda {
    where(["users.board_member = ? and users.account_active = ?", true, true])
  }
  scope :member_directory, lambda {
    where(["users.account_active = ? and users.include_in_directory = ?", true, true])
  }
    
  scope :new_members, lambda {
    member_directory.order("created_at DESC").limit(5)
  }
  
  scope :with_profile, lambda {
    where(["users.account_active = ? and users.biography IS NOT NULL", true])
  }
  
  scope :for_email_blast, lambda {
    where(["users.account_active = ? and users.receive_emails = ?", true, true])
  }
  
  scope :for_forum_notification, lambda {
    for_email_blast.where("users.notify_on_new_post = ?", true)
  }
  
  def active?
    self.account_active? || self.login == 'admin'
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