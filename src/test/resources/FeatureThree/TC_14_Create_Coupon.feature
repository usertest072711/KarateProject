Feature: create coupon



  Background:

    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken



    * def random_string =
    """
    function(s){
    var text = "";
    var pattern = "abcdefghijklmnopqrstuvwxyz";
    for( var i=0 ; i<s; i++)
    text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
    return text;
    }
    """
    * def randomString = random_string(10)
    * print randomString

    * def requestpayload =
    """
    {
  "name": "Season sale",
  "couponCode": "GET1090",
  "type": "FLAT",
  "discountValue": 600,
  "minimumCartValue": 700,
  "expiryDate": "2024-12-13T11:07:10.693Z",
  "startDate": "2023-02-13T11:07:10.693Z"
}

    """



    *  requestpayload.couponCode = randomString
    * print requestpayload






  Scenario: create new coupon

    Given url 'https://api.freeapi.app/api/v1/ecommerce/coupons'
    And request requestpayload

    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'
    And header Content-Type = 'application/json'

    When method post
    Then status 201
    * print response
    * def couponid = response.data._id
    * print couponid

