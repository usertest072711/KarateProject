Feature: POST request handling

  Scenario: Send POST request with data

    # Define the URL for the POST request
    Given url 'https://reqres.in/api/users'

    # Define the request payload using data from the CSV
    And request { name: '#(data.name)', job: '#(data.job)' }

    # Send the POST request
    When method post

    # Assert the response status
    Then status 201

    # Optionally log the response
    * def response = karate.response
    * karate.log('Response:', response)
    * print response
