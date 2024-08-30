Feature: Test creating users with data from CSV

  Scenario: Create users using data from a CSV file
    # Step 1: Read the CSV file from the classpath
    * def csvData = read('classpath:data.csv')

  """
    * def parseCsv = function(data) {
  var result = [];
  var lines = data.split('\n');
  var headers = lines[0].split(',');
  for (var i = 1; i < lines.length; i++) {
  var obj = {};
  var currentLine = lines[i].split(',');
  for (var j = 0; j < headers.length; j++) {
  obj[headers[j]] = currentLine[j];
  }
  result.push(obj);
  }
  return result;
  }

  """

    # Step 3: Convert CSV data to JSON format
    * def jsonData = parseCsv(csvData)
    * print 'Parsed JSON Data:', jsonData

    # Step 4: Iterate through the JSON data and make POST requests
    * def createUser = function(user) {karate.callSingle('create-user.feature', { user: user })}

    # Step 5: Make a POST request for each user in the CSV data
    * def responses = []
    * karate.forEach(jsonData, function(user) {var response = createUser(user)responses.push(response)})

    # Optionally, print all responses
    * print 'Responses:', responses
