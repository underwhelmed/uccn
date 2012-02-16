Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :login => login,
           :account_active => true,
           :first_name => "Testing",
           :last_name => "User",
           :password => password,
           :password_confirmation => password).save!
end

Given /^I have one\s+admin "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :login => login,
           :admin => true,
           :account_active => true,
           :first_name => "Administrator",
           :last_name => "Account",
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@example.net'
  login = 'testuser'
  password = 'secretpass'

  step %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  step %{I go to login}
  step %{I fill in "user_email" with "#{email}"}
  step %{I fill in "user_password" with "#{password}"}
  step %{I press "Sign in"}
end

Given /^I am signed in as an administrator$/ do
  email = 'testing@example.net'
  login = 'admin'
  password = 'testing1'

  step %{I have one admin "#{email}" with password "#{password}" and login "#{login}"}
  step %{I go to login}
  step %{I fill in "Username" with "#{login}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Login"}
end

Given /^"([^"]*)" is set to not receive emails$/ do |login|
  u = User.find_by_login(login)
  u.receive_emails = false
  u.save!
end



