Feature: Agregar nuevo veterinario a través de un RESTful API

Scenario: Agregar nuevo veterinario exitosamente
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud POST a la endpoint /clinics/{clinicId}/vets
    And el payload contiene los datos del nuevo veterinario
    Then el usuario recibe un código de estado 201
    And el usuario recibe una confirmación de que el veterinario ha sido agregado

    Examples: Agregar nuevo veterinario exitosamente

    | endpoint                    | clinicId | vetName     |
    |-----------------------------|----------|-------------|
    | /clinics/1/vets             | 1        | Dr. Brown   |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de clínicas
    When el usuario realiza una solicitud POST a la endpoint /clinics/{clinicId}/vets
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint                    | error_message        |
    |-----------------------------|----------------------|
    | /clinics/1/vets             | Service Unavailable  |
