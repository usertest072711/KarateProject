Feature: Use CSV data in POST requests

  Scenario: POST request with data from CSV

    # Read the CSV file
    * def csvData = karate.read('classpath:data.csv')

    # Convert CSV data to JSON
    * def rows = karate.csvToJson(csvData)

    # Loop through each row and send a POST request
    * karate.forEach(rows, function(row) {karate.callSingle('classpath:post_request_handler.feature', { data: row });})
