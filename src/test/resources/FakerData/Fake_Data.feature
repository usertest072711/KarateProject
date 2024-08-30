Feature: User Registration


  Background:
    * def datagen = Java.type('JavFaker.RandomDataGenerator')



  Scenario: Use Faker to generate random data
    # Generate random data using Faker
    * def randomName = datagen.getName()
    * def randomEmail = datagen.getEmail()

    # Print generated data
    * print 'Random Name:', randomName
    * print 'Random Email:', randomEmail


    # Use generated data in assertions or API requests
    Given url 'https://api.freeapi.app/api/v1/users/register'
    And request { username: '#(randomName)', email: '#(randomEmail)', password: 'Test@123', role: 'ADMIN' }
    When method POST
    Then status 200
    And print response