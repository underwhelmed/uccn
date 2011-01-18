Feature: Adding a New Event
  So I can let users know about upcoming events
  as an administrator
  I want to be able to add events to the calendar
  
  Background:
    Given I am signed in as an administrator
  
  Scenario: Adding an event that has an invalid duration and is not set for an all day event should return an error
    Given I am on the Add New Event Page
    And I fill in "Name" with "Testing Event"
    And I fill in "Description" with "Another Sweet Test"    
    And I press "Create Event"
    Then I should see "Please set a valid end time for this event"