Feature: Viewing the Calendar By Day

  So they can see upcoming events for a day
  users
  should be able to view the details of events
  
  Scenario: Unauthenticated user views events for a 
    Given I have Events with the following attributes:
      |name       |description      |start_at           |end_at             |members_only |all_day  |event_category_id  |
      |Testing12  |Testing this out |2011/1/20 17:00    |2011/1/20 19:00    |true         |false    |1                  |
      |Testing34  |Testing this out |2011/1/20 06:00    |2011/1/21 05:59:59 |false        |true     |1                  |
      |Testing56  |Testing this out |2011/1/23 17:00    |2011/1/23 19:00    |false        |false    |1                  |
    And I am not authenticated
    And I am on the Calendar Day page for 2011/1/20
    Then I should not see "Testing12"
    And I should see "Testing34"
    And I should not see "Testing56"