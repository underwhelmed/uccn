def create_my_user(params)
  unless user = User.find_by_login(params[:login])
    params[:password_confirmation] = params[:password]
    user = User.create!(params)
    user.confirm!
  end
  user
end

Given /^I am signed in as an admin$/ do
  @current_user = User.new(:login => 'admin', :admin => true)
end

Given /^the admin has filled out the required fields$/ do
  @params = {:user => {:login => 'newuser', :email => 'email', :first_name => 'Test', :last_name => 'User', :password => 'test123', :password_confirmation => 'test123'}}
end

Given /^the Send Welcome Email field is not checked$/ do
  @params[:send_welcome_email] = false
end

When /^the admin creates a new user$/ do
  post "/admin/users", @params
end

Then /^the new user will be created successfully$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the new user should not receive a welcome email$/ do
  pending # express the regexp above with the code you wish you had
end
