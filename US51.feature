Feature: Obtener métrica de Latidos de mascota actualizada a través de un RESTful API

Scenario: Obtener métrica de latidos exitosamente
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud GET a la endpoint /pets/{petId}/heartbeat
    Then el usuario recibe un código de estado 200
    And el usuario recibe las métricas de latidos de la mascota

    Examples: Obtener métrica de latidos exitosamente

    | endpoint                    | petId | heartbeat |
    |-----------------------------|-------|-----------|
    | /pets/1/heartbeat           | 1     | 120 bpm   |

Scenario: Manejar error cuando la API no está disponible
    Given el usuario tiene acceso a la API de mascotas
    When el usuario realiza una solicitud GET a la endpoint /pets/{petId}/heartbeat
    And la API no está disponible
    Then el usuario recibe un mensaje de error indicando que el servicio no está disponible

    Examples: Manejar error cuando la API no está disponible

    | endpoint                    | error_message        |
    |-----------------------------|----------------------|
    | /pets/1/heartbeat           | Service Unavailable  |
