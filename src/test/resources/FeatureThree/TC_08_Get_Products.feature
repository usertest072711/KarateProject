Feature:  get products

  Scenario: get all products

    Given url 'https://api.freeapi.app/api/v1/ecommerce/products?page=1&limit=10'
    And header accept = 'application/json'
    When method get
    Then status 200
    And print response