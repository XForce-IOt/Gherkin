Feature: Obtener listado de horarios disponibles para un Veterinario a través de un RESTful API

Scenario: Obtener listado de horarios disponibles exitosamente
    Given el usuario tiene acceso a la API de veterinarios
    And existe un veterinario con el ID 1 que tiene horarios disponibles
    When el usuario realiza una solicitud GET a la endpoint /veterinarians/1
    Then el usuario recibe un listado de horarios disponibles

    Examples:

    |      endpoint      | day | time | vet_id |
    |--------------------|-----|------|--------|
    |  /veterinarians/1  |  1  | 10am |    1   |

Scenario: Manejar error cuando el veterinario no tiene horarios disponibles
    Given el usuario tiene acceso a la API de veterinarios
    And existe un veterinario con el ID 2 que no tiene horarios disponibles
    When el usuario realiza una solicitud GET a la endpoint /veterinarians/2
    Then el usuario recibe un mensaje indicando que el veterinario no tiene horarios disponibles

    Examples:

    |      endpoint      |     message     |
    |--------------------|-----------------|
    |  /veterinarians/2  | No appointments |