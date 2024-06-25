Feature: Agregar nuevo dueño de mascota a través de un RESTful API

Scenario: Agregar nuevo dueño de mascota exitosamente
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud POST a la endpoint /owners
    And el payload contiene los datos del nuevo dueño
    Then el usuario recibe un código de estado 201
    And el usuario recibe una confirmación de que el dueño ha sido agregado

    Examples: Agregar nuevo dueño de mascota exitosamente

    | endpoint | ownerName    |
    |----------|--------------|
    | /owners  | John Doe     |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud POST a la endpoint /owners
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint | error_message        |
    |----------|----------------------|
    | /owners  | Service Unavailable  |
