Given /^I am a registered, active user with email "([^\"]*)"$/ do |email|
  User.create :login => "testing", :first_name => "Test", :last_name => "User", :password => "testing1", :password_confirmation => "testing1", :email => email
end
