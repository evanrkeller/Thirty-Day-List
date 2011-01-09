@http://www.pivotaltracker.com/story/show/8284099
Feature: Consumer Adds Item To Their List
  In order to create a list items
  As a consumer logged in to the home page
  I want to to add an item to my list

  - Add Item link is visible
  - Clicking Add Item reveals the add item form
  - Area to provide description of the item is visible (required)
  - Add butting is visible
  - Clicking Add refreshes the page and the new item is visible on the list with 30 days to go

  Scenario:
    Given I am signed in as the following user:
      | email | demo@30daylist.com |
    When I am on the home page
    And I fill in "I want" with "A new bike"
    And I press "Add it to my list"
    Then I should see "A new bike" within "#items"


