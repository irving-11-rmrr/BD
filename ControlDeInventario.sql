-- Crear tabla de productos
CREATE TABLE Productos (
    IdProducto INT AUTO_INCREMENT PRIMARY KEY, -- Llave primaria autoincrementable
    Nombre VARCHAR(100),                       -- Nombre producto
    Precio DECIMAL(10,2),                      -- Precio producto
    Existencia INT                             -- Cantidad disponible
);

-- Cambiar delimitador
DELIMITER //

CREATE PROCEDURE ControlInventario(
    IN NombreProducto VARCHAR(100),  -- Nombre de entrada
    IN PrecioProducto DECIMAL(10,2), -- Precio de entrada
    IN ExistenciaProducto INT        -- Stock de entrada
)
BEGIN
    -- Variable para estado del stock
    DECLARE Estado VARCHAR(50);

    -- Validar precio negativo
    IF PrecioProducto < 0 THEN
        SELECT 'Rechazar registro: Precio negativo' AS Mensaje;
    ELSE
        -- Insertar registro valido
        INSERT INTO Productos (Nombre, Precio, Existencia)
        VALUES (NombreProducto, PrecioProducto, ExistenciaProducto);

        -- Evaluar cantidad en existencia
        IF ExistenciaProducto = 0 THEN
            SET Estado = 'Agotado';
        ELSEIF ExistenciaProducto BETWEEN 1 AND 10 THEN
            SET Estado = 'Stock bajo';
        ELSE
            SET Estado = 'Disponible';
        END IF;

        -- Mostrar producto y estado
        SELECT NombreProducto AS Nombre, PrecioProducto AS Precio, ExistenciaProducto AS Existencia, Estado;
    END IF;
END //

-- Restaurar delimitador
DELIMITER ;

-- Ejecutar pruebas
CALL ControlInventario('Balon', 450.00, 15);
CALL ControlInventario('Red', 120.00, 5);
CALL ControlInventario('Silbato', 80.00, 0);
CALL ControlInventario('Error', -50.00, 10);