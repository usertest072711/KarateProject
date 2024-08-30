Feature: Example API Test

  Scenario: Print JSON response

    * def jsonObject =

    """
    [
    {
    "name" : "Tom",
    "city" : "Mumbai"
    },
    {
    "name" : "rita",
    "city" : "delhi"
    }
    ]
    """

    * print jsonObject
    * print jsonObject[0].name