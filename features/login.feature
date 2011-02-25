Feature: Logging into the application

  So that users get redirected to the correct place
  users
  should be directed to the appropriate location upon successful login
  
  Scenario: User logs in via sign in 
    Given I am not authenticated
    And I have one user "example@example.com" with password "dooderpants55" and login "userman"
    And I am on the home page
    And I follow "Members"
    And I fill in "Username" with "userman"
    And I fill in "Password" with "dooderpants55"
    And I press "Login"
    Then I should be on the members page
    
  Scenario: User tries to access forums while not logged in should be redirected to forums after logging in
    Given I am not authenticated
    And I am on the forum index    
    And I have one user "example@example.com" with password "dooderpants55" and login "userman"    
    And I fill in "Username" with "userman"
    And I fill in "Password" with "dooderpants55"
    And I press "Login"
    Then I should be on the forum index
