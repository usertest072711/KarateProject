Feature: Post request

  Background:

    * url 'https://reqres.in/api'
    * def requestpayload = read('classpath:postreq.json')

  Scenario: post request with assertions

    Given path '/users'
    And request requestpayload
    And set requestpayload.job = 'doctor'
    When method post
    Then status 201
    And print response
