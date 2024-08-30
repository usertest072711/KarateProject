Feature: User API

  Scenario: Validate user response against schema
    Given url 'https://reqres.in/api/users/2'
    When method get
    Then status 200
    Then match response == '#object'
    * def jsonSchemaExpected =
    """
    {
  "data": {
    "id": '#number',
    "email": '#string',
    "first_name": '#string',
    "last_name": '#string',
    "avatar": '#string'
  },
  "support": {
    "url": '#string',
    "text": '#string''
  }
}
    """



    * match response == jsonSchemaExpected

