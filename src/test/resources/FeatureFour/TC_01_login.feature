 Feature: save data


   Background:

     * def requestpayload = read('classpath:LoginRequest.json')

   Scenario: save data in file

     Given url 'https://api.freeapi.app/api/v1/users/login'
     And request requestpayload
     When method post
     Then status 200
     * print response
     * def responseJson = response
     * def accesstoken = response.data.accessToken
     * def writeToFile =
    """
    function(response) {
        var FileWriter = Java.type('java.io.FileWriter');
        var file = new FileWriter('src/test/resources/FeatureTwo/response.json');
        file.write(JSON.stringify(response));
        file.close();
    }
    """
     * eval writeToFile(accesstoken)