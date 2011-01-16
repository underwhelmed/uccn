Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :login => login,
           :first_name => "Testing",
           :last_name => "User",
           :password => password,
           :password_confirmation => password).save!
end

Given /^I have one\s+admin "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
  User.new(:email => email,
           :login => login,
           :admin => true,
           :first_name => "Administrator",
           :last_name => "Account",
           :password => password,
           :password_confirmation => password).save!
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@example.net'
  login = 'testuser'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I am signed in as an administrator$/ do
  email = 'testing@example.net'
  login = 'admin'
  password = 'testing1'

  Given %{I have one admin "#{email}" with password "#{password}" and login "#{login}"}
  And %{I go to login}
  And %{I fill in "Username" with "#{login}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Login"}
end


