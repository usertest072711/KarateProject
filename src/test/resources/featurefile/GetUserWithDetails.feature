Feature: get the users details with query parameter

  Scenario: get the user details with query params


    * def query  = {gender: 'male' , status:'active'}
    Given url 'https://gorest.co.in/public/v2/users'

    And params query
    When method GET
    Then status 200

    * print response




