-- Cambiar delimitador
DELIMITER //

CREATE PROCEDURE ClasificarEdad(
    IN Nombre VARCHAR(100), -- Nombre de entrada
    IN Edad INT             -- Edad de entrada
)
BEGIN
    -- Variable para guardar clasificacion
    DECLARE Clasificacion VARCHAR(50);

    -- Evaluar rango de edad
    IF Edad < 18 THEN
        SET Clasificacion = 'Menor de edad';
    ELSEIF Edad BETWEEN 18 AND 59 THEN
        SET Clasificacion = 'Adulto';
    ELSE
        SET Clasificacion = 'Adulto mayor';
    END IF;

    -- Mostrar resultado
    SELECT Nombre, Edad, Clasificacion;
END //

-- Restaurar delimitador
DELIMITER ;

-- Ejecutar procedimiento
CALL ClasificarEdad('Ricardo', 21);