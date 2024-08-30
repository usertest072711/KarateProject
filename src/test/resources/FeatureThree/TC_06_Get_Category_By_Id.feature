Feature: get category by its id


  Scenario: get category by id

   # * def catgId = karate.get('categoryid')
    # * print  catgId


  * def createcatresult = call read('classpath:FeatureThree/TC_05_Create_Category.feature')
  * def catid = createcatresult.categoryid

  #* print catid

    Given url 'https://api.freeapi.app/api/v1/ecommerce/categories/'
    And path catid
  #* def CategoryID = karate.get('categoryid')
  # * print 'CategoryID :' , categoryid




    When method get
    Then status 200
    And print response