# Parte 1 - Ejercicio de Consultas SQL

En esta sección se realizan operaciones básicas de creación, inserción, actualización, eliminación y restauración de datos en una tabla llamada `productos`.

---

## Creación y selección de la base de datos

Primero se crea una base de datos llamada `Parte1` y se selecciona para su uso:

```sql
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Parte1;

-- Selección de la base de datos
USE Parte1;
```

---

## Creación de la tabla `productos`

Aquí definimos la estructura de la tabla, que incluye un identificador autoincrementable, nombre, precio y stock del producto.

```sql
-- Crear la tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT NOT NULL,
    stock INT NOT NULL
);
```

---

## Inserción de datos

A continuación insertamos varios productos en la tabla, especificando nombre, precio y cantidad en stock.

```sql
-- Insertar múltiples productos
INSERT INTO
    productos (nombre, precio, stock)
VALUES 
    ('Laptop', 800, 50),
    ('Smartphone', 600, 100),
    ('Tablet', 300, 30);
```

---

## Agregar un nuevo producto

Insertamos un producto adicional con todos sus datos, incluyendo el `id_producto` manualmente.

```sql
-- Insertar un nuevo producto: "Auriculares"
INSERT INTO productos (
    id_producto,
    nombre,
    precio,
    stock
)
VALUES (4, 'Auriculares', 150, 200);
```

---

## Actualización de un producto

Actualizamos el precio del producto "Laptop" a un nuevo valor.

```sql
-- Actualizar el precio de "Laptop"
UPDATE productos 
SET precio = 750 
WHERE nombre = 'Laptop';
```

---

## Eliminación de un producto

Se elimina el producto "Tablet" de la tabla.

```sql
-- Eliminar el producto "Tablet"
DELETE FROM productos 
WHERE nombre = 'Tablet';
```

---

## Limpieza de registros

Eliminamos **todos los registros** de la tabla sin afectar su estructura.

```sql
-- Eliminar todos los registros de la tabla
TRUNCATE TABLE productos;
```

---

## Eliminación de la tabla

Finalmente, se elimina completamente la tabla `productos` de la base de datos si existe.

```sql
-- Eliminar la tabla "productos" de forma segura
DROP TABLE IF EXISTS productos;
```
