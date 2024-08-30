Feature: update user

  Scenario: update the user details with put request

    * def reqpayload = read('classpath:putreq.json')
    Given 'https://reqres.in/api/users/2'
    And request reqpayload
    When method put
    Then status 200

    * print response