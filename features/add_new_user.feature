Feature: Adding a new user
  So that I can add users
  As an Administrator
  I want to be able to add users and select if they receive an welcome email
  
  Scenario: A user is created by an admin and not selected to send an email
    Given I am signed in as an admin
    And the admin has filled out the required fields
    And the Send Welcome Email field is not checked
    When the admin creates a new user
    Then the new user will be created successfully
    And the new user should not receive a welcome email