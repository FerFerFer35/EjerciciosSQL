# Parte 3 - Ejercicio de Consultas SQL Complejas

## Creación y uso de base de datos

```sql
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Parte3;

-- Selección de la base de datos
USE Parte3;
```

## Creación de tablas

```sql
-- Crear tabla clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100)
);
```

```sql
-- Insertar datos en clientes
INSERT INTO clientes (id_cliente, nombre, ciudad)
VALUES 
    (1, 'Juan Pérez', 'Madrid'),
    (2, 'María López', 'Barcelona'),
    (3, 'Pedro Gómez', 'Valencia'),
    (4, 'Lucía Fernández', 'Sevilla');
```

```sql
-- Crear tabla pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    producto VARCHAR(100),
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);
```

```sql
-- Insertar datos en pedidos
INSERT INTO pedidos (id_pedido, id_cliente, producto, cantidad, fecha)
VALUES 
    (1, 1, 'Laptop', 1, '2024-01-10'),
    (2, 2, 'Smartphone', 2, '2024-01-12'),
    (3, 1, 'Tablet', 3, '2024-02-01'),
    (4, 3, 'Auriculares', 1, '2024-02-15'),
    (5, 2, 'Monitor', 1, '2024-03-05');
```

## Consultas

```sql
-- Escribe una consulta SQL para actualizar la ciudad de todos los clientes que estén en "Madrid" o "Barcelona" a "Valencia".
UPDATE clientes
SET ciudad = 'Valencia'
WHERE ciudad IN ('Madrid', 'Barcelona');
```
**Explicación:** Esta consulta actualiza la ciudad a "Valencia" para todos los clientes que vivan en "Madrid" o "Barcelona".

---

```sql
-- Escribe una consulta SQL que devuelva el nombre de los clientes y el producto de sus pedidos, ordenados por el nombre del cliente.
SELECT c.nombre, p.producto
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
ORDER BY c.nombre;
```
**Explicación:** Devuelve los nombres de los clientes y los productos que han pedido, ordenados alfabéticamente por nombre.

---

```sql
-- Escribe una consulta SQL para contar el número de pedidos por cliente, mostrando el nombre del cliente y la cantidad de pedidos. Incluye todos los clientes, incluso aquellos que no tienen pedidos.
SELECT c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;
```
**Explicación:** Cuenta cuántos pedidos tiene cada cliente, incluyendo a los que no tienen ninguno.

---

```sql
-- Escribe una consulta SQL para eliminar todos los pedidos que no tienen un cliente asociado, utilizando un RIGHT JOIN.
DELETE p
FROM pedidos p
RIGHT JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;
```
**Explicación:** Elimina los pedidos que no están vinculados a ningún cliente existente en la tabla `clientes`.
