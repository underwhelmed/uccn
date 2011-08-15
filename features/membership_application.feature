Feature: Membership Application

  In order to let users join the UCCN
  website users
  should be able to submit a membership application
  
  Scenario: Submitting an application with valid information
    Given I am on the membership application page
    When I fill in "First name" with "Peter"
    And I fill in "Last name" with "Griffin"
    And I fill in "Business name" with "Nerds"
    And I fill in "Address 1" with "2443 Main Street"
    And I fill in "City" with "Quahog"
    And I fill in "State" with "Rhode Island"
    And I fill in "Postal code" with "55345"
    And I fill in "Email" with "test@example.com"
    And I fill in "Phone number" with "555-555-5555"
    And I fill in "Date of birth" with "January 5"
    And I press "Submit"
    Then I should see "Your application request has been successfully submitted"
    And I should be on the successful membership request page
    And "barb-peterson@sbcglobal.net" should receive an email
    When "barb-peterson@sbcglobal.net" opens the email with subject "New UCCN Membership Application Request"
    And I should see "You have received a new application" in the email body    