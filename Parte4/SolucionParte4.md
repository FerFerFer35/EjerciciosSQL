# Parte 4 - Ejercicios de SQL con JOINs

## Creación y uso de base de datos

```sql
-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS Parte4;

-- Seleccionar la base de datos
USE Parte4;
```

## Crear tablas e insertar datos

```sql
-- Crear tabla de clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100)
);

-- Insertar datos en la tabla clientes
INSERT INTO clientes (id_cliente, nombre, ciudad)
VALUES 
    (1, 'Juan Pérez', 'Madrid'),
    (2, 'María López', 'Barcelona'),
    (3, 'Pedro Gómez', 'Valencia'),
    (4, 'Lucía Fernández', 'Sevilla');
```

```sql
-- Crear tabla de pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    producto VARCHAR(100),
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
);

-- Insertar datos en la tabla pedidos
INSERT INTO pedidos (id_pedido, id_cliente, producto, cantidad, fecha)
VALUES 
    (1, 1, 'Laptop', 1, '2024-01-10'),
    (2, 2, 'Smartphone', 2, '2024-01-12'),
    (3, 1, 'Tablet', 3, '2024-02-01'),
    (4, 3, 'Auriculares', 1, '2024-02-15'),
    (5, 2, 'Monitor', 1, '2024-03-05');
```

## Consultas con JOINs, INSERTs, UPDATEs y DELETEs

```sql
-- Obtener nombre de los clientes y sus productos comprados
SELECT c.nombre, p.producto
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;
```
**Explicación:** Muestra el nombre de los clientes y los productos que compraron.

---

```sql
-- Insertar un nuevo pedido copiando datos de otro pedido para Juan Pérez
INSERT INTO pedidos (id_cliente, producto, cantidad, fecha)
SELECT 1, p.producto, p.cantidad, '2024-04-01'
FROM pedidos p
WHERE p.id_pedido = 3;
```
**Explicación:** Crea un nuevo pedido para Juan Pérez usando los datos del pedido 3.

---

```sql
-- Aumentar en 5 la cantidad de pedidos de clientes en Madrid
UPDATE pedidos p
LEFT JOIN clientes c ON p.id_cliente = c.id_cliente
SET p.cantidad = p.cantidad + 5
WHERE c.ciudad = 'Madrid';
```
**Explicación:** Incrementa la cantidad de productos para pedidos hechos por clientes en Madrid.

---

```sql
-- Eliminar todos los pedidos realizados por Pedro Gómez
DELETE p
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE c.nombre = 'Pedro Gómez';
```
**Explicación:** Elimina todos los pedidos que hizo Pedro Gómez.

---

```sql
-- Obtener todos los clientes y sus pedidos, incluso los que no han comprado
SELECT c.nombre, p.producto
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;
```
**Explicación:** Muestra todos los clientes y sus pedidos, incluyendo a los que no tienen ninguno.

---

```sql
-- Insertar nuevo cliente y su pedido asociado
INSERT INTO clientes (id_cliente, nombre, ciudad)
VALUES (5, 'Ana Torres', 'Bilbao');

INSERT INTO pedidos (id_pedido, id_cliente, producto, cantidad, fecha)
VALUES (6, 5, 'Teclado', 1, '2024-04-10');
```
**Explicación:** Agrega a Ana Torres como nueva clienta junto con un pedido.

---

```sql
-- Cambiar ciudad a "Zona Premium" para quienes compraron "Monitor"
UPDATE clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
SET c.ciudad = 'Zona Premium'
WHERE p.producto = 'Monitor';
```
**Explicación:** Cambia la ciudad de clientes que compraron un Monitor a "Zona Premium".

---

```sql
-- Eliminar pedidos sin cliente asociado
DELETE p
FROM pedidos p
LEFT JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;
```
**Explicación:** Borra pedidos que no están ligados a ningún cliente.

---

```sql
-- Mostrar todos los pedidos y nombre del cliente, incluyendo sin cliente
SELECT p.producto, c.nombre
FROM pedidos p
RIGHT JOIN clientes c ON p.id_cliente = c.id_cliente;
```
**Explicación:** Muestra todos los pedidos y sus clientes, aunque algunos pedidos no tengan cliente asociado.

---

```sql
-- Insertar nuevo pedido para Juan Pérez copiando info del pedido 3
INSERT INTO pedidos (id_cliente, producto, cantidad, fecha)
SELECT 1, p.producto, p.cantidad, '2024-04-01'
FROM pedidos p
WHERE p.id_pedido = 3;
```
**Explicación:** Igual que antes, se vuelve a copiar un pedido anterior para Juan Pérez.

---

```sql
-- Cambiar productos de clientes en Sevilla a "Producto Alternativo"
UPDATE pedidos p
RIGHT JOIN clientes c ON p.id_cliente = c.id_cliente
SET p.producto = 'Producto Alternativo'
WHERE c.ciudad = 'Sevilla';
```
**Explicación:** Cambia los productos de los pedidos hechos por clientes que viven en Sevilla.

---

```sql
-- Eliminar pedidos con cantidad menor o igual a 1
DELETE p
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente
WHERE p.cantidad <= 1;
```
**Explicación:** Borra todos los pedidos cuya cantidad de productos es 1 o menos.

---

```sql
-- Contar el total de pedidos por cliente
SELECT c.nombre, COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;
```
**Explicación:** Muestra cuántos pedidos ha hecho cada cliente.

---

```sql
-- Cambiar ciudad a "Frecuente" para clientes con más de 2 pedidos
UPDATE clientes c
LEFT JOIN (
    SELECT id_cliente
    FROM pedidos
    GROUP BY id_cliente
    HAVING COUNT(id_pedido) > 2
) AS subquery ON c.id_cliente = subquery.id_cliente
SET c.ciudad = 'Frecuente'
WHERE subquery.id_cliente IS NOT NULL;
```
**Explicación:** Marca como "Frecuente" a los clientes con más de 2 pedidos.

---

```sql
-- Eliminar clientes que no tengan pedidos asociados
DELETE c
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.id_pedido IS NULL;
```
**Explicación:** Borra los clientes que no han hecho ningún pedido.
