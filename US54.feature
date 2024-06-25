Feature: Obtener Latidos de mascota en tiempo real a través de un RESTful API

Scenario: Obtener latidos en tiempo real exitosamente
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud GET a la endpoint /pets/{petId}/heartbeat/realtime
    Then el usuario recibe un código de estado 200
    And el usuario recibe los latidos en tiempo real de la mascota

    Examples: Obtener latidos en tiempo real exitosamente

    | endpoint                            | petId | heartbeat |
    |-------------------------------------|-------|-----------|
    | /pets/1/heartbeat/realtime          | 1     | 125 bpm   |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud GET a la endpoint /pets/{petId}/heartbeat/realtime
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint                            | error_message        |
    |-------------------------------------|----------------------|
    | /pets/1/heartbeat/realtime          | Service Unavailable  |
