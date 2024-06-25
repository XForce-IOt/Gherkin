Feature: Editar perfil de dueño de mascota a través de un RESTful API

Scenario: Editar perfil de dueño de mascota exitosamente
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud PUT a la endpoint /owners/{ownerId}
    And el payload contiene los nuevos datos del dueño
    Then el usuario recibe un código de estado 200
    And el usuario recibe una confirmación de que el perfil ha sido actualizado

    Examples: Editar perfil de dueño de mascota exitosamente

    | endpoint          | ownerId | newName  |
    |-------------------|---------|----------|
    | /owners/1         | 1       | Jane Doe |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud PUT a la endpoint /owners/{ownerId}
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint          | error_message        |
    |-------------------|----------------------|
    | /owners/1         | Service Unavailable  |
