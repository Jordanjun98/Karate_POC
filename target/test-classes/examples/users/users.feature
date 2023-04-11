Feature:
  Background:
    * url 'https://gorest.co.in/public/v2/users'

  Scenario: 1. Create a user to the endpoint
    Given url 'https://gorest.co.in/public/v2/users'
    And header Authorization = 'Bearer 7175d5fc7f5b180b0eccbfcad0fe156f7e98a8b7d61b13857cc5c911a92b1def'
    And request
                """
                { "name":"TEST0001355",
                "email":"TEST0001355@mailnesia.com",
                "gender":"female",
                "status":"active"}
                """
  #    * multipart file loadfile = {read: 'GG.json',  contentType: 'application/json'}
    When method post
    Then status 201


  Scenario: 2. Get all user response
    Given url 'https://gorest.co.in/public/v2/users'
    And headers {Accept:'application/json', Content-Type:'application/json'}
    When method get
    Then status 200
#    And def name = response[0].name
    And  def responseArray = response

  Scenario: 3 Loop all of the json response in foreach
    Given url 'https://gorest.co.in/public/v2/users'
    When method get
    Then status 200
    * def responseArray = response
    * karate.forEach(responseArray, function(item, index) { karate.log(item.id) })


  Scenario: 4 Get a booking id details
    Given url 'https://gorest.co.in/public/v2/users'
    When method get
    Then status 200
    * def responseArray = response
    * karate.forEach(responseArray, function(item, index) { karate.log(item.id) })



#    * match each  responseArray[*] == {id: '#number', name: '#string', email: '#string' ,gender: '#string', status: '#string'}
#    * def responseObj = {}
#    * karate.forEach(responseArray, function(item){responseObj[item.id] = item})
#    * karate.forEach(responseArray, function(item, index){ responseObj[item]=index})

#    * def keys = karate.keysOf(responseObj)


#    * karate.forEach(keys, function(key){ karate.log(responseObj[key]) = item })
#    * print keys
#    * print 'ID: ', id

