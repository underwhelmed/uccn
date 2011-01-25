Feature: Managing Blog Posts
  In order for users to view posts
  As an administrator
  I want to be able to manage my blog posts by adding and editing them
  
  Background:
    Given I am signed in as an administrator
  
  Scenario: New blog post gets the correct Url
    Given I am on the Add New Blog Post page
    And I fill in "Title" with "Testing this out"
    And I fill in "Body" with "What a wonderful test"
    And I select "Public" from "post_members_only"
    And I select "Published" from "post_published"
    And I fill in "post_published_at" with "12/25/2008 10:00"
    And I press "Create Post"
    Then I should be on the Edit Posts page 
    And I should have a post with a slug of "testing-this-out" and a url of "/2008/12/25/testing-this-out"
    
  Scenario: New blog post with no body that is published is not valid
    Given I am on the Add New Blog Post page
    And I fill in "Title" with "Testing this out Again"
    And I select "Public" from "post_members_only"
    And I select "Published" from "post_published"
    And I fill in "post_published_at" with "12/25/2008 10:00"
    And I press "Create Post"
    Then I should see "A published post needs to have a body"
    
  Scenario: New blog post with no published date is not valid
    Given I am on the Add New Blog Post page
    And I fill in "Title" with "Testing this out with an invalid date"
    And I fill in "Body" with "What's going on fools"
    And I select "Public" from "post_members_only"
    And I select "Published" from "post_published"
    And I press "Create Post"
    Then I should see "A published post needs to have a published date"