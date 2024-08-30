Feature: delete category


  Background:

    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken


    * def createcatresult = call read('classpath:FeatureThree/TC_05_Create_Category.feature')
    * def catid = createcatresult.categoryid

  Scenario: delete catefory by id
    Given url 'https://api.freeapi.app/api/v1/ecommerce/categories/'
    And path catid
    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'
    And header Content-Type = 'application/json'

    When method delete
    Then status 200
    And print response