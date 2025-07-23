-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS exercisesql;

-- Usar la base de datos creada
USE exercisesql;

-- Crear la tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT NOT NULL,
    stock INT NOT NULL
);

-- Insertar multiples productos
INSERT INTO
    productos (nombre, precio, stock)
VALUES ('Laptop', 800, 50),
    ('Smartphone', 600, 100),
    ('Tablet', 300, 30);

-- Insertar un producto
INSERT INTO productos VALUES ('Auriculares', 150, 200);

-- Actualizar el precio de un producto (Laptop)
UPDATE productos SET precio = 900 WHERE nombre = 'Laptop';

-- Eliminar un producto (Tablet)
DELETE FROM productos WHERE nombre = 'Tablet';

-- Eliminar todos los registros de la tabla productos sin eliminar la estructura de la tabla
TRUNCATE TABLE productos;

-- Eliminar la tabla productos
DROP TABLE IF EXISTS productos;