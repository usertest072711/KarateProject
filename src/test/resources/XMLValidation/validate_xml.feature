Feature: xml response

  Scenario: validate xml response

    Given url 'https://mocktarget.apigee.net/xml'
    When method get
    Then status 200
    * print response
    * match response/root/city == 'San Jose'
    * match response/root/firstName == 'John'
    * match response/root/lastName == 'Doe'
    * match response/root/state == 'CA'
