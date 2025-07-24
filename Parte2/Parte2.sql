-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Parte2;

-- Selección de la base de datos
USE Parte2;

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- Tabla de pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    producto VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Insertar datos en la tabla clientes
INSERT INTO
    clientes (nombre)
VALUES ('Juan Perez'),
    ('Maria Lopez'),
    ('Pedro Gomez');
-- Insertar datos en la tabla pedidos
INSERT INTO
    pedidos (
        id_cliente,
        producto,
        cantidad
    )
VALUES (1, 'Laptop', 1),
    (2, 'Smartphone', 2),
    (1, 'Tablet', 3),
    (3, 'Auriculares', 1);

-- INNER JOIN: Escribe una consulta SQL para obtener una lista de todos los clientes que tienen pedidos, mostrando el nombre del cliente y el producto del pedido.
SELECT clientes.id_cliente, clientes.nombre, pedidos.producto
FROM clientes
    INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;

-- LEFT JOIN: Escribe una consulta SQL para obtener una lista de todos los clientes y sus pedidos, mostrando el nombre del cliente y el producto. Incluye a todos los clientes, incluso si no tienen pedidos.
SELECT clientes.id_cliente, clientes.nombre, pedidos.producto
FROM clientes
    LEFT JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;

-- RIGHT JOIN: Escribe una consulta SQL para obtener una lista de todos los pedidos y el nombre del cliente que los realizó, mostrando el nombre del cliente y el producto. Incluye todos los pedidos, incluso si no tienen un cliente asociado.
SELECT clientes.nombre, pedidos.producto
FROM pedidos
    RIGHT JOIN clientes ON clientes.id_cliente = pedidos.id_cliente;