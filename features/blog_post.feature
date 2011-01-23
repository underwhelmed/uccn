Feature: Managing Blog Posts
  In order for users to view posts
  As an administrator
  I want to be able to manage my blog posts by adding and editing them
  
  Background:
    Given I am signed in as an administrator
  
  Scenario: New blog post
    Given I am on the Add New Blog Post page
    And I fill in "Title" with "Testing this out"
    And I fill in "Body" with "What a wonderful test"
    And I select "Public" from "post_members_only"
    And I select "Published" from "post_published"
    And I select "December 25, 2008 10:00" as the "Publish Date" date and time 
    And I press "Create Post"
    Then I should be on the Edit Posts page 
    And I should have a post with a url of "/2008/12/25/testing-this-out"