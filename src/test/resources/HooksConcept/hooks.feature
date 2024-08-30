Feature: Example with After Hook

  Background:
    * def baseUrl = 'https://reqres.in/api'
    * def cleanup =
  """
  function() {
  karate.log('Cleanup after scenario');
  }
  """

  Scenario: Fetch users from page 2
    Given url baseUrl
    And path 'users'
    And param page = 2
    When method GET
    Then status 200
    # After Hook - simulated by calling the cleanup function
    * cleanup()
    * print response
