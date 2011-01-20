Feature: Retrieving the User's Password

  Because users forget their password
  as a user
  I should be able to set a new password
  
  Scenario: Submitting a valid email address
    Given I am a registered, active user with email "testing@example.com"
    And I am on the login page
    When I follow "Password Recovery page"
    Then I should be on the Password Recovery page
    When I fill in "Email" with "testing@example.com"
    And I press "Send me reset password instructions"
    Then I should be on the sign_in page
    And I should see "You will receive an email with instructions about how to reset your password in a few minutes."
    And "testing@example.com" should receive an email
    When "testing@example.com" opens the email with subject "UCCN Website - Reset password instructions"
    And I should see "Someone has requested a link to change your password" in the email body
    