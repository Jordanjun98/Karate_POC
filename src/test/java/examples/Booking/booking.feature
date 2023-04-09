Feature: As a user i wan to create and view booking

  Background:
    Given url urlBase

  Scenario: 1. Get the token
    Given url urlBase + '/auth'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    And request
                """
                { "username" : "admin",
                "password" : "password123"}
                """
  #    * multipart file loadfile = {read: 'GG.json',  contentType: 'application/json'}
    When method post
    Then status 200

  Scenario: 2. Get the booking ids
    Given url urlBase + '/booking'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    When method get
    Then status 200
    * def responseArray = response
#    * def newArr = []
    * karate.forEach(responseArray, function(item, index) { karate.log(item.bookingid) })
#    * karate.forEach(responseArray, function(item, index) { newArr.push(item.bookingid) })
#    * karate.log(newArr[1])
    #    * karate.forEach(responseArray, function(item, index) { karate.log(item.bookingid) })


  Scenario: 3. Create the booking
    Given url urlBase + '/booking'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    And request
    """
      { "firstname" : "Jim",
      "lastname" : "Brown",
      "totalprice" : 111,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2018-01-01",
          "checkout" : "2019-01-01"
      },
      "additionalneeds" : "Brunch" }
      """
    When method post
    Then status 200


  Scenario: 4. Get the booking id specific detail
    Given url urlBase + '/booking/1943'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    When method get
    Then status 200




