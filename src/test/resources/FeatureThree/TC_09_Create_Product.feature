Feature: create product

  Background:
    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken

    * def createcatresult = call read('classpath:FeatureThree/TC_05_Create_Category.feature')
    * def catid = createcatresult.categoryid
    * print catid


    * def ProductID = karate.get('productid')

 # Step 1: Create new product

  Scenario: create new product

    * def mainImage = karate.read('classpath:images/mickey.jpg')
    * def subImages = karate.read('classpath:images/thLDIJJSP0.jpg')



    Given url 'https://api.freeapi.app/api/v1/ecommerce/products'



    And header Authorization = 'Bearer ' + token
    And header accept = 'application/json'




    And multipart field category = catid
    And multipart field description = 'New description number 2'
    And multipart file mainImage = { file: mainImage, filename: 'mickey.jpg', contentType: 'image/jpeg' }
    And multipart field name = 'Kids product'
    And multipart field price = '230'
    And multipart field stock = 30
    And multipart file subImages = { file: subImage, filename: 'thLDIJJSP0.jpg', contentType: 'image/jpeg' }



    When method post
    Then status 201
    * print response
    * def productid = response.data._id
    * print productid




