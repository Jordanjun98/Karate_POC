Feature: As a user i wan to get all booking details


#  @GetBookingID
  Scenario: 1. Get the booking id specific detail
    * call read('classpath:examples/Booking/booking.feature@CreateBooking')
    Given url urlBase + '/booking/'+bookingID
    And headers {Accept:'application/json', Content-Type:'application/json'}
    When method get
    Then status 200
