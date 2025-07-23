-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Parte1;

-- Selección de la base de datos
USE Parte1;

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

-- Escribe una consulta SQL para insertar un nuevo producto con los siguientes valores:
-- id_producto: 4
-- nombre: "Auriculares"
-- precio: 150
-- stock: 200
INSERT INTO
    productos (
        id_producto,
        nombre,
        precio,
        stock
    )
VALUES (4, 'Auriculares', 150, 200);

-- Escribe una consulta SQL para actualizar el precio de "Laptop" a 750.
UPDATE productos SET precio = 750 WHERE nombre = 'Laptop';

-- Escribe una consulta SQL para eliminar el producto "Tablet" de la tabla.
DELETE FROM productos WHERE nombre = 'Tablet';

-- Eliminar todos los registros de la tabla sin eliminar la estructura.
TRUNCATE TABLE productos;

-- Escribe una consulta SQL para eliminar la tabla productos de la base de datos.
DROP TABLE IF EXISTS productos;