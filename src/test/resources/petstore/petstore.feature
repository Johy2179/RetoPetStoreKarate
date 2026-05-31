Feature: Flujo completo de la PetStore - Evidencias de log

  Background:
    * url 'https://petstore.swagger.io/v2/pet'
    * header Accept = 'application/json'
    * def petId = 999888777
    

  Scenario: 1. Añadir una mascota
    * def pet = { "id": #(petId), "name": "Firulais", "status": "available" }
    Given request pet
    When method post
    Then status 200
    * print 'Mascota creada con éxito, respuesta recibida.'

  Scenario: 2. Consultar la mascota por ID
    Given path petId
    When method get
    Then status 200
    * print 'Mascota encontrada:', response.name
    And match response.name == 'Firulais'

  Scenario: 3. Actualizar nombre y estatus a "sold"
    * def petActualizado = { "id": #(petId), "name": "Firulais navideño", "status": "sold" }
    Given request petActualizado
    When method put
    Then status 200
    * print 'Actualización confirmada.'

  Scenario: 4. Consultar mascota por estatus "sold"
    Given url 'https://petstore.swagger.io/v2/pet/findByStatus'
    And param status = 'sold'
    * print 'Buscando mascotas vendidas...'
    When method get
    Then status 200
    And match response[*].id contains petId
