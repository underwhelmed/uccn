class Membership < ActiveRecord::Base  
  before_validation :generate_token, :on => :create
  
  validates_presence_of :business_name, :first_name, :last_name, :address_1, :city, :state, :postal_code, :date_of_birth, :email, :phone_number, :token
  validates_uniqueness_of :token
  
  attr_accessible :business_name, :first_name, :last_name, :address_1, :address_2, :city, :state, :postal_code, :date_of_birth, :email, :phone_number, :member_type, :new_member, :license_type, :license_number, :interest_newsletter, :interest_website, :interest_networking, :interest_cpr, :interest_backup, :interest_meetings, :interest_field_trips, :interest_other, :topic_requests, :christmas, :manna, :membership, :newsletter, :public_relations, :publish_address, :referral_info, :token

  def generate_token
    random_token = build_token
    while Membership.find_by_token(random_token) != nil
      random_token = build_token
    end
    self.token = random_token
  end
  
  private
  
    def build_token
      ActiveSupport::SecureRandom.hex(8)
    end

end