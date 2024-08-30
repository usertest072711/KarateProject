Feature: get profile

  Background:


    * def Baseurl = 'https://api.freeapi.app/api/v1/'
    * def token = read('classpath:response.json')
    * def requestpayload = read('classpath:UpdateProfile.json')

  Scenario: get user profile




    Given url Baseurl + 'ecommerce/profile'
    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'
    When method get
    Then status 200
    And print response


    Scenario: update profile

      Given url Baseurl + 'ecommerce/profile'
      And request requestpayload
      And header Authorization = 'Bearer ' + token
      And header accept = 'application/json'
      When method patch
      Then status 200
      And print response




