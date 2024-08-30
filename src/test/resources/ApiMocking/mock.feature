# mock-service.feature

Feature: Mock Service

  Background:
    * def mockUrl = 'http://localhost:3000'

  Scenario: Return a specific response for GET request
    Given url mockUrl
    And request { "message": "Hello, World!" }
    When method get
    Then status 200
    And print response
    And match response.message == 'Hello, World!'

