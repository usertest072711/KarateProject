Feature: get users

  Scenario: get all users
    Given url 'https://gorest.co.in/public/v1/users'
    When method get
    Then status 200
    When def outputData = []
    And eval for (var i=0; i<response.data.length;i++)if(response.data[i].name.endsWith("Anunay Patel"))outputData.push(response.data[i].email)

    Then print outputData
