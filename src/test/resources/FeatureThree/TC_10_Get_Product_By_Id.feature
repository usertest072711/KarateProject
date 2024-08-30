Feature: get product by id




  Background:
    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken

    * def createcatresult = call read('classpath:FeatureThree/TC_05_Create_Category.feature')
    * def catid = createcatresult.categoryid
    * print catid

    * def CreateProdresult = call read('classpath:FeatureThree/TC_09_Create_And _Get_Product.feature')
    * def Prodid = CreateProdresult.productid

  Scenario: get product details by id

    Given url 'https://api.freeapi.app/api/v1/ecommerce/products/'


    And path Prodid
    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'
    When method get
    Then status 200
    And print response