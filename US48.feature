Feature: Obtener listado de Mascotas a través de un RESTful API

Scenario: Obtener listado de mascotas exitosamente
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud GET a la endpoint /pets
    Then el usuario recibe un código de estado 200
    And el usuario recibe un listado de mascotas

    Examples: Obtener listado de mascotas exitosamente

    | endpoint | id | name |
    |----------|----|------|
    |   /pet   | 1  | Max  |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud GET a la endpoint /pets
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint |    error_message    |
    |----------|---------------------|
    | /pets    | Service Unavailable |