Feature: Create new category

  Background:
    * def createcat = read('classpath:CreateCategory.json')

    * def loginResult = callonce read('classpath:FeatureThree/TC_02_Login.feature')
    * def token = loginResult.accessToken

Scenario: create category
Given url 'https://api.freeapi.app/api/v1/ecommerce/categories'
And request createcat
And header Authorization = 'Bearer ' + token
And header accept = 'application/json'
And header Content-Type = 'application/json'
When method post
Then status 201
And print response
* def categoryid = response.data._id
  * karate.set('categoryid', categoryid)
  And print categoryid

 # * def newcatid = function() {return { 'categoryid': categoryid}; }
  #* return {categoryid : categoryid}
  #* def catgId = karate.get('categoryid')
  #And print catgId


