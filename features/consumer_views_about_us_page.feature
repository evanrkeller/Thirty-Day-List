@http://www.pivotaltracker.com/story/show/8209605
Feature: Consumer views About page
  In order to get some basic information about 30daylist.com
  As a consumer visiting the site
  I want to see the About page

  - About is visible in the main navigation
  - Clicking "About" takes me to the About page
  - "About 30daylist.com" page headline is visible
  - About Us content is visible

  Scenario:
    Given I am on the home page
    When I follow "About"
    Then I should see "About 30daylist.com"
