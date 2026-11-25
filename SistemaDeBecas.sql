-- Cambiar delimitador
DELIMITER //

CREATE PROCEDURE EvaluarBeca(
    IN Nombre VARCHAR(100),      -- Nombre alumno
    IN Calificacion DECIMAL(5,2) -- Calificacion con decimales
)
BEGIN
    -- Variable para tipo de beca
    DECLARE Beca VARCHAR(50);

    -- Evaluar rango de calificacion
    IF Calificacion >= 95 AND Calificacion <= 100 THEN
        SET Beca = 'Beca completa';
    ELSEIF Calificacion >= 90 AND Calificacion <= 94.99 THEN
        SET Beca = 'Media beca';
    ELSE
        SET Beca = 'Sin beca';
    END IF;

    -- Mostrar resultado
    SELECT Nombre, Calificacion, Beca;
END //

-- Restaurar delimitador
DELIMITER ;

-- Ejecutar procedimiento
CALL EvaluarBeca('Ricardo', 94.99);