Feature: Put request

  Background:

    * url 'https://reqres.in/api'
    * def requestpayload = read('classpath:putreq.json')

  Scenario: post request with assertions

    Given path '/users/2'
    And request requestpayload
    When method put
    Then status 200
    And print response

