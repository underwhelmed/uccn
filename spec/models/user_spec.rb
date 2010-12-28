require 'spec_helper'

describe User do
  
  it "is valid with valid attributes" do
    User.new.should be_valid
  end
  
  it "is not valid without a login"
  
  it "is not valid without a first name"
  
  it "is not valid without a last name"
  
  it "is not valid without a password"
  
  it "is not valid without a password confirmation"
  
  it "is not valid without an email address"
  
  it "should set the default value of admin to false" do
    u = User.new
    u.login = 'testing'
    u.first_name = 'Monty'
    u.last_name = 'Python'
    u.password = 'testing123'
    u.password_confirmation = 'testing123'
    u.email = 'testing@example.com'    
    u.save!
    u.valid?.should == true
    u.admin.should == false
  end
  
end
