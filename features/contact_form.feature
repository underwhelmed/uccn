Feature: Contact Form

  In order to tell us something
  users
  want to contact us online without having to leave their browser

  Scenario: Submitting with valid information
    Given I am on the contact page
    When I fill in "Name" with "Matthias Marschall"
    And I fill in "Email" with "test@example.com"
    And I fill in "Phone" with "630-555-5555"
    And I fill in "Message" with "What's up?"
    And I press "Send"
    Then I should see "Thanks for your feedback!"
    And "irishpeg@comcast.net" should receive an email
    When "irishpeg@comcast.net" opens the email with subject "Feedback from the UCCN website"
    And I should see "What's up?" in the email body
