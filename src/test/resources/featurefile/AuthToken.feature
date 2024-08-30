Feature: get the users details

  Scenario: get the user details with user id
    Given header Authorization = 'Bearer '+ tokenID
    Given url baseUrl+'/ecommerce/profile'

    When method GET
    Then status 200