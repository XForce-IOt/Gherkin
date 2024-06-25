Feature: Obtener listado de Veterinarios por una Clínica a través de un RESTful API

Scenario: Obtener listado de veterinarios exitosamente
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud GET a la endpoint /clinics/{clinicId}/vets
    Then el usuario recibe un código de estado 200
    And el usuario recibe un listado de veterinarios

    Examples: Obtener listado de veterinarios exitosamente

    | endpoint                     | clinicId | vetName   |
    |------------------------------|----------|-----------|
    | /clinics/1/vets              | 1        | Dr. Smith |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud GET a la endpoint /clinics/{clinicId}/vets
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint                     | error_message        |
    |------------------------------|----------------------|
    | /clinics/1/vets              | Service Unavailable  |
