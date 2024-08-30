Feature: update product by id




  Background:
    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken

    * def createcatresult = call read('classpath:FeatureThree/TC_05_Create_Category.feature')
    * def catid = createcatresult.categoryid


    * def CreateProdresult = call read('classpath:FeatureThree/TC_09_Create_And _Get_Product.feature')
    * def Prodid = CreateProdresult.productid

  Scenario: update product by id new product

    * def mainImage = karate.read('classpath:images/mickey.jpg')
    * def subImages = karate.read('classpath:images/thLDIJJSP0.jpg')



    Given url 'https://api.freeapi.app/api/v1/ecommerce/products'

    And path Prodid



    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'




    And multipart field category = catid
    And multipart field description = 'New description number 2'
    And multipart file mainImage = { file: mainImage, filename: 'mickey.jpg', contentType: 'image/jpeg' }
    And multipart field name = 'mens product'
    And multipart field price = '240'
    And multipart field stock = 80
    And multipart file subImages = { file: subImage, filename: 'thLDIJJSP0.jpg', contentType: 'image/jpeg' }



    When method patch
    Then status 200
    * print response

