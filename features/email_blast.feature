Feature: Email Blast

  In order to let members know about information
  administrators
  want to send emails to all members
  
  Background: 
   Given I am signed in as an administrator
   And I have one user "test_user@example.com" with password "testing123" and login "test_user"   
    
  Scenario: Submitting with valid information to user set to receive emails
    Given I am on the send email page
    When I fill in "Subject" with "Peter Griffin"
    And I fill in "Body" with "This is a test"
    And I press "Send Email"
    Then I should see "Your emails were successfully sent"
    And "test_user@example.com" should receive an email
    When "test_user@example.com" opens the email with subject "Peter Griffin"
    And I should see "This is a test" in the email body
    
  