Feature: As a user i wan to update the booking details

  @UpdateBoooking
#    @ignore
  Scenario: 1. Update the booking details
    * call read('classpath:examples/Booking/GetBookingDetails.feature@CreateBooking')
    Given url urlBase + '/booking/'+bookingID
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