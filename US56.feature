Feature: Obtener Temperatura de mascota en tiempo real a través de un RESTful API

Scenario: Obtener temperatura en tiempo real exitosamente
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud GET a la endpoint /pets/{petId}/temperature/realtime
    Then el usuario recibe un código de estado 200
    And el usuario recibe la temperatura en tiempo real de la mascota

    Examples: Obtener temperatura en tiempo real exitosamente

    | endpoint                                | petId | temperature |
    |-----------------------------------------|-------|-------------|
    | /pets/1/temperature/realtime            | 1     | 38.5°C      |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud GET a la endpoint /pets/{petId}/temperature/realtime
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint                                | error_message        |
    |-----------------------------------------|----------------------|
    | /pets/1/temperature/realtime            | Service Unavailable  |
