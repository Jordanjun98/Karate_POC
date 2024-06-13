Feature: As a user i wan to get token
  Background:

  Given url urlBase

  @ignore
  Scenario: 1. Get the token
    Given url urlBase + '/auth'
    And headers { Accept:'application/json', Content-Type:'application/json'}
    And request
    """
    { "username" : "admin",
      "password" : "password123"
     } """
  #    * multipart file loadfile = {read: 'GG.json',  contentType: 'application/json'}
    When method post
    Then status 200
    * token = response
    * karate.log(token)