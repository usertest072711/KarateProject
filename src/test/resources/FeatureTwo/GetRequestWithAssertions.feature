Feature:  Get request

  Background:
    * url 'https://reqres.in/api'


  Scenario: get request one

    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200
    And  print response

    Scenario: get request two with background
      Given path '/users?page=2'
      When method get
      Then  status 200
      And print response

      Scenario: get request three with background and path parameters

        Given path '/users'
        And param page = 2
        When method get
        Then status 200
        And print response
        And print response.data[2].first_name
        And match response.data[2].first_name == 'Tobias'

