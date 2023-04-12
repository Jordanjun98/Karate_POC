Feature: As a user i wan to create a booking

  Background:
    Given url urlBase
#    * def token = call read('token.feature') { token: '#(token)' }

  @ignore
  Scenario: 1. Get the booking ids
    Given url urlBase + '/booking'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    When method get
    Then status 200
    * def responseArray = response

#    * def responseArray[2].bookingid
#   * karate.log(newArr[1])
#    * karate.forEach(responseArray, function(item, index) { karate.log(item.bookingid) })
#   * karate.forEach(responseArray, function(item, index) { newArr.push(item.bookingid) })

  @CreateBooking
  Scenario: 2. Create the booking
    Given url urlBase + '/booking'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    And request read('PostCapture.json')
    When method post
    Then status 200
    * def bookingID = response.bookingid
    * karate.log(bookingID)
    And match bookingID == '#number'








