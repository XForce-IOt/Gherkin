Feature: Sincronizar collar y agregar nueva Mascota a través de un RESTful API

Scenario: Sincronizar collar y agregar nueva mascota exitosamente
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud POST a la endpoint /collars/sync
    And el payload contiene los datos del collar y de la nueva mascota
    Then el usuario recibe un código de estado 201
    And el usuario recibe una confirmación de que la mascota ha sido agregada y el collar sincronizado

    Examples: Sincronizar collar y agregar nueva mascota exitosamente

    | endpoint          | collarId | petName  |
    |-------------------|----------|----------|
    | /collars/sync     | 1        | Buddy    |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud POST a la endpoint /collars/sync
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint          | error_message        |
    |-------------------|----------------------|
    | /collars/sync     | Service Unavailable  |
