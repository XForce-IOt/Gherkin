Feature: Editar perfil de mascota a través de un RESTful API

Scenario: Editar perfil de mascota exitosamente
    Given el usuario tiene acceso a la API de mascotas
    And existe una mascota con el ID 1
    And el usuario tiene los nuevos datos de la mascota (nombre, raza, edad)
    When el usuario realiza una solicitud PUT a la endpoint /pets/1 con los nuevos datos
    Then el usuario recibe un código de estado 200
    And los datos de la mascota son actualizados correctamente en el sistema
    And el usuario recibe los datos actualizados de la mascota

    Examples:

    | endpoint |  name   |  breed  | age  |
    |----------|---------|---------|------|
    | /pets/1  | Fido    | Labrador|  5   |

Scenario: Manejar error cuando la mascota no existe
    Given el usuario tiene acceso a la API de mascotas
    And no existe una mascota con el ID 999
    And el usuario tiene quiere editar los datos de la mascota (nombre, raza, edad)
    When el usuario realiza una solicitud PUT a la endpoint /pets/999 con los nuevos datos
    Then el usuario recibe un mensaje de error indicando que la mascota no fue encontrada

    Examples:

    | endpoint  |     error_message      |
    |-----------|------------------------|
    | /pets/999 |     Pet not found      |