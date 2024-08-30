Feature: get the API header feature

  Scenario: Pass user request with headers part 1
    Given header User-Agent = 'PostmanRuntime/7.41.1'


    * def query  = {page: 2}
    When url 'https://reqres.in/api/users'

    And params query
    When method GET
    Then status 200
    * print response

  Scenario: Pass user request with headers part 2
   * def  request_headers = {User-Agent: 'PostmanRuntime/7.41.1', Connection: 'keep-alive' }

    Given headers request_headers


    * def query  = {page: 2}
    When url 'https://reqres.in/api/users'

    And params query
    When method GET
    Then status 200
    * print response
    * print request_headers

  Scenario: Pass user request with headers part 3
    * configure headers = {User-Agent: 'PostmanRuntime/7.41.1', Connection: 'keep-alive' }




    * def query  = {page: 2}
    When url 'https://reqres.in/api/users'

    And params query
    When method GET
    Then status 200
    * print response





