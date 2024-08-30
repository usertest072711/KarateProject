Feature: get all coupons

  Background:
    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken

  Scenario: get all the coupons
    Given url 'https://api.freeapi.app/api/v1/ecommerce/coupons?page=1&limit=5'
    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'
    And header Content-Type = 'application/json'
    When method get
    Then status 200
    * print response


