Feature: Obtener datos de una mascota a través de un RESTful API

Scenario: Obtener datos de una mascota exitosamente
    Given el usuario tiene acceso a la API de mascotas
    And existe una mascota con el ID 1
    When el usuario realiza una solicitud GET a la endpoint /pets/1
    Then el usuario recibe un código de estado 200
    And el usuario recibe los datos de la mascota
    And los datos de la mascota contienen el ID, nombre, raza, y edad

    Examples:

    | endpoint | id | name | breed | age |
    |----------|----|------|-------|-----|
    | /pets/1  | 1  | Max  | Pug   | 5   |

Scenario: Manejar error cuando la mascota no existe
    Given el usuario tiene acceso a la API de mascotas
    And no existe una mascota con el ID 999
    When el usuario realiza una solicitud GET a la endpoint /pets/999
    Then el usuario recibe un mensaje de error indicando que la mascota no fue encontrada

    Examples:

    | endpoint  |     error_message      |
    |-----------|------------------------|
    | /pets/999 |     Pet not found      |