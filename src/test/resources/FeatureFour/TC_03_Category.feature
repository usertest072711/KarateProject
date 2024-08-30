Feature: get categories

  Background:
    * def Baseurl = 'https://api.freeapi.app/api/v1/'
    * def token = read('classpath:response.json')
    * def requestpayload = read('classpath:CreateCategory.json')
    * def catid = read('classpath:CategoryID.json')


  Scenario: get all categories

    Given url Baseurl + 'ecommerce/categories?page=1&limit=5'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And print response


    Scenario: create categories

      Given url Baseurl + 'ecommerce/categories'
      And request requestpayload
      And header Authorization = 'Bearer ' + token
      And header accept = 'application/json'
      When method post
      Then status 201
      And print response
      * def categoryid = response.data._id

      * def writeToFile =
    """
    function(response) {
        var FileWriter = Java.type('java.io.FileWriter');
        var file = new FileWriter('src/test/resources/CategoryID.json');
        file.write(JSON.stringify(response));
        file.close();
    }
    """
      * eval writeToFile(categoryid)


      Scenario: get category by id

        Given url Baseurl + 'ecommerce/categories/'
        And path catid
        And header Authorization = 'Bearer ' + token
        And header accept = 'application/json'
        When method get
        Then status 200
        And print response