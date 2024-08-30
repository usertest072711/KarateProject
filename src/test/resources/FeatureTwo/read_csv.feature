Feature: read dat from csv


  Scenario Outline:


    Given url 'https://reqres.in/api/users'
    And request {"name": <name>,"job":<job>}
    When method post
    Then status 201
    And print response

    Examples:
      |read('classpath:data.csv')|



 # Scenario: read data from csv file
 #   Then eval data = read('classpath:data.csv')
  #  And print data

