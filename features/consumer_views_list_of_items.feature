@http://www.pivotaltracker.com/story/show/8283815
Feature: Consumer Views List of Items
  In order to see what items are on my Thirty-Day list
  As a consumer logged in to the home page
  I want to see my list of items

  - Newest items are on the top of the list
  - For each item on the list less than 30 days I see a greyed out listing with:
    - Name
    - Number of days to go
  - For each item on the list more than 30 days I see a green listing with:
    - Name
    - Number of days on the list

  Scenario:
    Given I am signed in as the following user:
      | email | demo@30daylist.com |
    And that user has the following item:
      | name       | Thing I think I really want |
    When I am on the home page
    Then I should see "Thing I think I really want" within "#items"
    And I should see "30 days to go" within "#items"

  Scenario: After 30 days
    Given I am signed in as the following user:
      | email | demo@30daylist.com |
    And that user has the following item:
      | name       | Thing I'm not sure I really want |
    When I wait 31 days
    And I am on the home page
    Then I should see "Thing I'm not sure I really want" within "#items"
    And I should see "added 31 days ago" within "#items"
