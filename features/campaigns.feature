@api
Feature: Display information about campaigns in UI

  Background: 
    Given I want to create a certificate via the API
    And I apply a campaign "brian"
    And I request a certificate via the API
    And the certificate is created
    And I request a certificate via the API
    
  Scenario: list campaigns
    When I visit the campaigns page
    Then I should see "brian"
    
  Scenario: view single campaign
    When I visit the campaign page for "brian"
    Then I should see "2 datasets inspected"
    And I should see "1 dataset added"
    And I should see "1 certificate published"
    And I should see "1 dataset already existed"
    
  Scenario: view single campaign as CSV
    When I visit the campaign page for "brian.csv"
    Then I should get a CSV file