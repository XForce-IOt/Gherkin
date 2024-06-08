Feature: Obtener listado de Citas por un Dueño de mascota a través de un RESTful API

Scenario: Obtener listado de citas exitosamente
    Given el usuario tiene acceso a la API de citas
    And existe un dueño de mascota con el ID 1 que tiene citas agendadas
    When el usuario realiza una solicitud GET a la endpoint
    Then el usuario recibe un listado de citas

    Examples:

    |           endpoint             | day | time | pet_id | owner_id |
    |--------------------------------|-----|------|--------|----------|
    | /pet-owners/1/appointments     | 1   | 10am |    1   |    1     |

Scenario: Manejar error cuando el dueño de mascota no tiene citas
    Given el usuario tiene acceso a la API de citas
    And existe un dueño de mascota con el ID 2 que no tiene citas agendadas
    When el usuario realiza una solicitud GET a la endpoint /pet-owners/2/appointments
    Then el usuario recibe un mensaje indicando que la mascota no tiene citas agendadas

    Examples:

    |           endpoint             |     message     |
    |--------------------------------|-----------------|
    | /pet-owners/2/appointments     | No appointments |