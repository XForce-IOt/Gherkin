Feature: Obtener listado de Clínicas a través de un RESTful API

Scenario: Obtener listado de clínicas exitosamente
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud GET a la endpoint /clinics
    Then el usuario recibe un listado de clínicas 

    Examples:

    | endpoint | id | name | address | phone | email |
    |----------|----|------|---------|-------|-------|
    | /clinics | 1  | Vet  | 123 St  | 12345 | vet@  |

Scenario: Manejar error cuando no hay clínicas disponibles
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud GET a la endpoint /clinics
    And no hay clínicas disponibles en el sistema
    Then el usuario recibe un mensaje indicando que no hay clínicas disponibles

    Examples:

    | endpoint |      message     |
    |----------|------------------|
    | /clinics | No clinics found |