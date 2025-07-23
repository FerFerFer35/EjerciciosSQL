# Parte 2 - Ejercicio de Consultas SQL con JOINs

Esta sección cubre la creación de una base de datos con relaciones entre tablas, inserciones de datos y ejemplos de uso de los diferentes tipos de `JOIN` en SQL.

---

## Creación y selección de la base de datos

```sql
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Parte2;

-- Selección de la base de datos
USE Parte2;
```

---

## Creación de tablas

Se definen dos tablas relacionadas mediante una clave foránea: `clientes` y `pedidos`.

```sql
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
```

---

## Inserción de datos

Insertamos algunos clientes y pedidos. Nota: uno de los pedidos hace referencia a un cliente que no existe (`id_cliente = 4`), lo cual podría generar un error si la clave foránea se valida.

```sql
-- Insertar datos en la tabla clientes
INSERT INTO clientes (nombre)
VALUES 
    ('Juan Perez'),
    ('Maria Lopez'),
    ('Pedro Gomez');

-- Insertar datos en la tabla pedidos
INSERT INTO pedidos (id_cliente, producto, cantidad)
VALUES 
    (1, 'Laptop', 1),
    (2, 'Smartphone', 2),
    (1, 'Tablet', 3),
    (4, 'Auriculares', 1);  -- ⚠️ Cliente con ID 4 no existe
```

---

## Consultas con JOIN

### INNER JOIN

Obtiene solo los clientes que **tienen pedidos**. Se muestran el ID del cliente, su nombre y el producto solicitado.

```sql
SELECT clientes.id_cliente, clientes.nombre, pedidos.producto
FROM clientes
INNER JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;
```

---

### LEFT JOIN

Lista **todos los clientes**, incluyendo aquellos que no tienen pedidos. Si un cliente no tiene pedidos, el campo `producto` será `NULL`.

```sql
SELECT clientes.id_cliente, clientes.nombre, pedidos.producto
FROM clientes
LEFT JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;
```

---

### RIGHT JOIN

Muestra todos los **pedidos**, incluyendo los que **no tienen un cliente asociado**. Si no hay un cliente correspondiente, el campo `nombre` será `NULL`.

```sql
SELECT clientes.nombre, pedidos.producto
FROM pedidos
RIGHT JOIN clientes ON clientes.id_cliente = pedidos.id_cliente;
```
