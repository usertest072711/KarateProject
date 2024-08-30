Feature: User Registration and Login

  Background:

    * def userpayload = read('classpath:LoginRequest.json')

    * def random_string =
    """
    function(s){
    var text = "";
    var pattern = "abcdefghijklmnopqrstuvwxyz";
    for( var i=0 ; i<s; i++)
    text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
    return text;
    }
    """
    * def randomString = random_string(10)
    * print randomString

    * def requestpayload =
    """
    {
  "email": "user.email@domain.com",
  "password": "test@123",
  "role": "ADMIN",
  "username": "doejohn"
}

    """



    *  requestpayload.email = randomString + "@domain.com"
    *  requestpayload.username = randomString
    * print requestpayload




  Scenario: Register a new user with random data

    Given url 'https://api.freeapi.app/api/v1/users/register'
    And request requestpayload
    When method post
    Then status 201
    * print response


  Scenario: login user



    Given url 'https://api.freeapi.app/api/v1/users/login'

    And request userpayload

    And header accept = 'application/json'
    And header Content-Type = 'application/json'

    When method post
    Then status 200
    And print response
    * def accessToken = response.data.accessToken
    * karate.set('accessToken', accessToken)
    And print accessToken



















