Feature: As a user i wan to update the booking details

  @UpdateBoooking
  Scenario: 1. Update the booking details
    * call read('classpath:examples/Booking/booking.feature@CreateBooking')
#    * call read('classpath:examples/Booking/GetBookingDetails.feature@GetBookingID')
    Given url urlBase + '/booking/'+bookingID
    And headers {Accept:'application/json', Content-Type:'application/json', Authorization:'Basic YWRtaW46cGFzc3dvcmQxMjM='}
    And request
      """
       { "firstname" : "Alex 1",
      "lastname" : "Update 2",
      "totalprice" : 500,
      "depositpaid" : true,
      "bookingdates" : {
          "checkin" : "2023-08-10",
          "checkout" : "2023-08-18"
      },
      "additionalneeds" : "Add bed" }
      """
    When method put
    Then status 200