Feature: Obtener datos de una Clínica a través de un RESTful API

Scenario: Obtener datos de una clínica exitosamente
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud GET a la endpoint /clinics/{clinicId}
    Then el usuario recibe un código de estado 200
    And el usuario recibe los datos de la clínica

    Examples: Obtener datos de una clínica exitosamente

    | endpoint            | clinicId | name      |
    |---------------------|----------|-----------|
    | /clinics/1          | 1        | VetClinic |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud GET a la endpoint /clinics/{clinicId}
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint            | error_message        |
    |---------------------|----------------------|
    | /clinics/1          | Service Unavailable  |
