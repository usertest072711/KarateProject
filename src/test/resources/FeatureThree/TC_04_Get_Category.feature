Feature:  get all categories







  Scenario: get categories

    Given url 'https://api.freeapi.app/api/v1/ecommerce/categories?page=1&limit=5'

    When method get
    Then status 200
    And print response



















