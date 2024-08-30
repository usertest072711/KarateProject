Feature: Create user

  Scenario: Create a user with the provided data
    Given url 'https://reqres.in/api/users'
    And request user
    When method post
    Then status 201
    And print 'Created User Response:', response
    * def response = karate.response
    * return response
