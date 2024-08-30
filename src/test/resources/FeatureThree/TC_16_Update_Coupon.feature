Feature: update coupon

  Background:

    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken

    * def createcoupon = call read('classpath:FeatureThree/TC_14_Create_Coupon.feature')
    * def coupid = createcoupon.couponid



    * def requestpayload = read('classpath:UpdateCoupon.json')








  Scenario: update coupon code

    Given url 'https://api.freeapi.app/api/v1/ecommerce/coupons/'
    And path coupid
    And request requestpayload
    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'
    And header Content-Type = 'application/json'

    When method patch
    Then status 200
    And print response
