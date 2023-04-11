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
    And request
    """
      { "firstname" : "Lee2",
      "lastname" : "Alex",
      "totalprice" : 360,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2023-08-08",
          "checkout" : "2023-08-18"
      },
      "additionalneeds" : "Brunch" }
      """
#    * multipart file loadfile = {read: 'PostCapture.json',  contentType: 'application/json'}
    When method post
    Then status 200
    * def bookingID = response.bookingid
    * karate.log(bookingID)
    And match bookingID == '#number'


  @ignore
  Scenario: 4. Update the booking details
    Given url urlBase + '/booking/665'
    And headers {Accept:'application/json', Content-Type:'application/json', Authorization:'Basic YWRtaW46cGFzc3dvcmQxMjM='}
    And request
      """
       { "firstname" : "LIM",
      "lastname" : "LIM EEEE",
      "totalprice" : 340,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2023-08-08",
          "checkout" : "2023-08-18"
      },
      "additionalneeds" : "Add bed" }
      """
    When method put
    Then status 200
#    * karate.log(token)







