@http://www.pivotaltracker.com/story/show/8183497
Feature: Consumer Views Privacy Policy
  In order to be informed about how my personal information is used
  As a consumer viewing the site
  I want to view the privacy policy

  - Privacy Policy is a link in the footer
  - Clicking Privacy Policy takes me to the privacy policy page
  - The headline "Privacy Policy" is visible
  - Content of the privacy policy is visible

  Scenario:
    Given I am on the privacy policy page
    Then I should see "Privacy Policy"
    And I should see "8213 2nd Ave"
