class Membership < ActiveRecord::Base
  validates_presence_of :business_name, :first_name, :last_name, :address_1, :address_2, :city, :state, :postal_code, :date_of_birth, :email, :phone_number
  attr_accessible :business_name, :first_name, :last_name, :address_1, :address_2, :city, :state, :postal_code, :date_of_birth, :email, :phone_number
  
end