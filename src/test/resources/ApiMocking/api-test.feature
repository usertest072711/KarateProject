Feature: Test API using Mock Server

  Scenario: Verify mock server response
    Given url '  http://localhost:3000'
    When method get
    Then status 200
    And match response.message == 'Hello, World!'
    And print response
