Feature: Create post request





  Scenario: Send a POST request
    * def requestpayload = read('classpath:postreq.json')

Given url 'https://reqres.in/api/users'
And request requestpayload

    When method post
Then status 201

    * print response

