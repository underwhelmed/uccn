Feature: Viewing the Calendar

  So they can see upcoming events
  users
  should be able to view the details of events
  
  Scenario: Unauthenticated user views correct events
    Given I have an Event with the following attributes:
      |name       |description      |start_at           |end_at             |members_only |all_day  |event_category_id  |
      |Testing12  |Testing this out |2011/1/20 17:00    |2011/1/20 19:00    |true         |false    |1                  |
      |Testing45  |Testing this out |2011/1/23 17:00    |2011/1/23 19:00    |false        |false    |1                  |
    And I am not authenticated
    And I am on the Calendar page
    Then I should not see "Testing12"
    And I should see "Testing45"