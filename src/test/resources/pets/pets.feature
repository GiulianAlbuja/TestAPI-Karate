Feature: Get pet test on petstore.swagger

  Background:
    * def urlBase = 'https://petstore.swagger.io/v2'
    * def petPath = '/pet'

  Scenario Outline: Add a pet to the store
    Given url urlBase + petPath
    And request
    """
    {
      "id": <petId>,
      "category": {
        "id": 0,
        "name": <categoryName>
      },
      "name": <petName>,
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": <status>
    }
    """
    When method POST
    Then status 200
    Examples:
      | petId  | categoryName | petName          | status    |
      | 575789 | Cat          | Tasmy Evangeline | available |
      | 575790 | Dog          | Coffe Fatimaria  | available |

  Scenario Outline: Get previously admitted pet with ID
    Given url urlBase + petPath + '/' + <previousId>
    When method GET
    Then status 200
    And match $..id contains [<actualId>]
    Examples:
      | previousId | actualId |
      | 575789     | 575789   |
      | 575790     | 575790   |

  Scenario Outline: Update pet name and pet status with PUT
    Given url urlBase + petPath
    And request
    """
    {
      "id": <petId>,
      "category": {
        "id": 0,
        "name": <categoryName>
      },
      "name": <petName>,
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": <status>
    }
    """
    When method PUT
    Examples:
    Then status 200
    Examples:
      | petId  | categoryName | petName          | status   |
      | 575789 | Cat          | Tasmy Evangeline | sold     |
      | 575790 | Dog          | Coffe Fatimaria  | cheerful |


  Scenario Outline: Update pet status with POST request with x-www-form-urlencoded data
    Given url urlBase + petPath + '/' + <previousId>
    And header Content-Type = 'application/x-www-form-urlencoded'
    And request 'status=<status>'
    When method POST
    Then status 200
    Examples:
      | previousId | status           |
      | 575789     | sold            |
      | 575790     | prettyCheerful  |

  Scenario Outline: Get previously admitted pet with status
    Given url urlBase + petPath + '/' + 'findByStatus?status=' + '<previousStatus>'
    When method GET
    Then status 200
    And match $..status contains [<actualStatus>]
    Examples:
      | previousStatus   | actualStatus     |
      | sold            | sold            |
      | prettyCheerful  | prettyCheerful  |
