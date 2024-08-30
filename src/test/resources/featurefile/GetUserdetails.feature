Feature: get the users details

  Scenario: get the user details with user id
    Given url 'https://gorest.co.in/public/v2/users'
    And  path '6940641'
    When method GET
    Then status 200

    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actualName = jsonResponse.name
    * print actualName
    * match actualName == 'Chandrakin Khatri I'