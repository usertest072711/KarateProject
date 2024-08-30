Feature: Conditional logic in Karate

  Scenario: Conditional validation based on user ID
    # Send the request
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200

    # Extract the response data
    * def response = response
    * def userId = response.data.id

    # Conditional validation using if-else
    * if (userId == 2) {
  karate.match(response.data.first_name, 'Janet')
  karate.match(response.data.last_name, 'Weaver')
  karate.match(response.data.email, 'janet.weaver@reqres.in')
  } else {
  karate.match(response.data.first_name, not null)
  karate.match(response.data.last_name, not null)
  }
