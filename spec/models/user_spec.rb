require 'spec_helper'

describe User do
  
  it "should set the default value of admin to false" do
    u = User.new
    u.login = 'testing'
    u.first_name = 'Monty'
    u.last_name = 'Python'
    u.password = 'testing123'
    u.password_confirmation = 'testing123'
    u.email = 'testing@example.com'   
    u.admin = false
    u.active = true 
    u.save!
    u.valid?.should == true
    u.admin.should == false
  end
  
end
