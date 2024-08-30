
Feature: Read data from Excel and make API requests

  Scenario: Read request data from Excel and send a POST request
    * def excelFile = read('classpath:mydata.xlsx')
    * def sheet = excelFile.getSheet('Sheet1')
    * def data = karate.fromExcelSheet(sheet)

    # Example: Reading the first row data
    * def requestData = data[0]

    # Make API request
    Given url 'https://reqres.in/api/users'
    And request requestData
    When method post
    Then status 201
    And match response.name == requestData.name
