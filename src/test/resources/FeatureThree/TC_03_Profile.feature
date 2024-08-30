Feature: profile details

  Background:

    //* def accessToken = karate.get('accessToken')

    * def updaterequest = read('classpath:UpdateProfile.json')
    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken
    * print token



  Scenario: get profile

    Given url 'https://api.freeapi.app/api/v1/ecommerce/profile'
    And request updaterequest
    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'

    When  method get
    Then status 200
    And print response


Scenario: update profile

  Given url 'https://api.freeapi.app/api/v1/ecommerce/profile'
  And header Authorization = 'Bearer ' + token
  And header accept = 'application/json'
  And header Content-Type = 'application/json'
  When method patch
  Then status 200
  And print response


