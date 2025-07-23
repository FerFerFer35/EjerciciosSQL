-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Parte4;

-- Selección de la base de datos
USE Parte4;

-- Crear tabla clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100)
);

-- Insertar datos en clientes
INSERT INTO
    clientes (id_cliente, nombre, ciudad)
VALUES (1, 'Juan Pérez', 'Madrid'),
    (2, 'María López', 'Barcelona'),
    (3, 'Pedro Gómez', 'Valencia'),
    (
        4,
        'Lucía Fernández',
        'Sevilla'
    );

-- Crear tabla pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    producto VARCHAR(100),
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Insertar datos en pedidos
INSERT INTO
    pedidos (
        id_pedido,
        id_cliente,
        producto,
        cantidad,
        fecha
    )
VALUES (
        1,
        1,
        'Laptop',
        1,
        '2024-01-10'
    ),
    (
        2,
        2,
        'Smartphone',
        2,
        '2024-01-12'
    ),
    (
        3,
        1,
        'Tablet',
        3,
        '2024-02-01'
    ),
    (
        4,
        3,
        'Auriculares',
        1,
        '2024-02-15'
    ),
    (
        5,
        2,
        'Monitor',
        1,
        '2024-03-05'
    );

-- SELECT con INNER JOIN: Obtén el nombre de los clientes y sus productos comprados.
SELECT c.nombre, p.producto
FROM clientes c
    INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;

-- INSERT con SELECT y INNER JOIN: Agrega un nuevo pedido para un cliente que ya existe (por ejemplo, "Juan Pérez") y copia los detalles de otro pedido.
INSERT INTO
    pedidos (
        id_cliente,
        producto,
        cantidad,
        fecha
    )
SELECT 1, p.producto, p.cantidad, '2024-04-01'
FROM pedidos p
WHERE
    p.id_pedido = 3;

-- UPDATE con LEFT JOIN: Aumenta la cantidad de productos para todos los pedidos de clientes en "Madrid" en 5.
UPDATE pedidos p
LEFT JOIN clientes c ON p.id_cliente = c.id_cliente
SET
    p.cantidad = p.cantidad + 5
WHERE
    c.ciudad = 'Madrid';

-- DELETE con INNER JOIN: Elimina todos los pedidos realizados por "Pedro Gómez".
DELETE p
FROM pedidos p
    INNER JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE
    c.nombre = 'Pedro Gómez';

-- SELECT con LEFT JOIN: Obtén la lista de todos los clientes y sus pedidos, incluyendo aquellos que no tienen pedidos.
SELECT c.nombre, p.producto
FROM clientes c
    LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;

-- INSERT con RIGHT JOIN: Inserta un nuevo cliente y un pedido asociado utilizando datos de otra tabla.
INSERT INTO
    clientes (id_cliente, nombre, ciudad)
VALUES (5, 'Ana Torres', 'Bilbao');

INSERT INTO
    pedidos (
        id_pedido,
        id_cliente,
        producto,
        cantidad,
        fecha
    )
VALUES (
        6,
        5,
        'Teclado',
        1,
        '2024-04-10'
    );

-- UPDATE con INNER JOIN: Cambia la ciudad de los clientes que han comprado "Monitor" a "Zona Premium".
UPDATE clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
SET
    c.ciudad = 'Zona Premium'
WHERE
    p.producto = 'Monitor';

-- DELETE con LEFT JOIN: Elimina los pedidos que no tienen un cliente asociado.
DELETE p
FROM pedidos p
    LEFT JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE
    c.id_cliente IS NULL;

-- SELECT con RIGHT JOIN: Muestra todos los pedidos y el nombre del cliente, incluyendo pedidos que no tienen clientes asociados.
SELECT p.producto, c.nombre
FROM pedidos p
    RIGHT JOIN clientes c ON p.id_cliente = c.id_cliente;

-- INSERT con INNER JOIN: Agrega un nuevo pedido para un cliente específico, copiando información de otro pedido.
INSERT INTO
    pedidos (
        id_cliente,
        producto,
        cantidad,
        fecha
    )
SELECT 1, p.producto, p.cantidad, '2024-04-01'
FROM pedidos p
WHERE
    p.id_pedido = 3;

-- UPDATE con RIGHT JOIN: Cambia el producto de todos los pedidos de clientes en "Sevilla" a "Producto Alternativo".
UPDATE pedidos p
RIGHT JOIN clientes c ON p.id_cliente = c.id_cliente
SET
    p.producto = 'Producto Alternativo'
WHERE
    c.ciudad = 'Sevilla';

-- DELETE con INNER JOIN: Elimina todos los pedidos que tienen una cantidad menor o igual a 1.
DELETE p
FROM pedidos p
    INNER JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE
    p.cantidad <= 1;

-- SELECT con GROUP BY: Muestra el total de pedidos por cliente.
SELECT c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
    LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente;

-- UPDATE con LEFT JOIN y GROUP BY: Cambia la ciudad de los clientes que tienen más de 2 pedidos a "Frecuente".
UPDATE clientes c
LEFT JOIN (
    SELECT id_cliente
    FROM pedidos
    GROUP BY
        id_cliente
    HAVING
        COUNT(id_pedido) > 2
) AS subquery ON c.id_cliente = subquery.id_cliente
SET
    c.ciudad = 'Frecuente'
WHERE
    subquery.id_cliente IS NOT NULL;

-- DELETE con LEFT JOIN: Elimina clientes que no tienen pedidos asociados.
DELETE c
FROM clientes c
    LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE
    p.id_pedido IS NULL;