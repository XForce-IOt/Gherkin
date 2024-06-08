Feature: Obtener listado de dirección de las Clínicas a través de un RESTful API

Scenario: Obtener listado de direcciones de clínicas exitosamente
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud GET a la endpoint /clinics
    Then el usuario recibe un listado de direcciones de clínicas

    Examples:

    | endpoint | id | address |
    |----------|----|---------|
    | /clinics | 1  | 123 St  |

Scenario: Manejar error cuando no hay direcciones de clínicas disponibles
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud GET a la endpoint /clinics
    And no hay direcciones de clínicas disponibles en el sistema
    Then el usuario recibe un mensaje indicando que no hay direcciones de clínicas disponibles

    Examples:

    | endpoint |       message      |
    |----------|--------------------|
    | /clinics | No addresses found |