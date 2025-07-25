# Ejercicio de Consultas SQL (Parte 1)

## Tabla `productos` (ejemplo)

| id_producto | nombre      | precio | stock |
|-------------|-------------|--------|-------|
| 1           | Laptop      | 800    | 50    |
| 2           | Smartphone  | 600    | 100   |
| 3           | Tablet      | 300    | 30    |

### Ejercicios:

1. Escribe una consulta SQL para insertar un nuevo producto con los siguientes valores:
   - `id_producto`: 4  
   - `nombre`: "Auriculares"  
   - `precio`: 150  
   - `stock`: 200

2. Escribe una consulta SQL para actualizar el precio de **"Laptop"** a **750**.

3. Escribe una consulta SQL para eliminar el producto **"Tablet"** de la tabla.

4. Escribe una consulta SQL para eliminar la tabla `productos` de la base de datos.

5. Supongamos que la tabla `productos` aún existe y deseas eliminar todos los registros de la tabla sin eliminar la estructura. Escribe la consulta correspondiente.

6. Después de haber eliminado la tabla y la información, escribe las consultas SQL correspondientes para crear la tabla y cargar la información que se muestra en la tabla de ejemplo.

---

# Ejercicio de Consultas SQL con JOINs (Parte 2)

## Tabla `clientes`

| id_cliente | nombre        |
|------------|---------------|
| 1          | Juan Pérez    |
| 2          | María López   |
| 3          | Pedro Gómez   |

## Tabla `pedidos`

| id_pedido | id_cliente | producto     | cantidad |
|-----------|------------|--------------|----------|
| 1         | 1          | Laptop       | 1        |
| 2         | 2          | Smartphone   | 2        |
| 3         | 1          | Tablet       | 3        |
| 4         | 4          | Auriculares  | 1        |

### Ejercicios:

1. **INNER JOIN**: Escribe una consulta SQL para obtener una lista de todos los clientes que tienen pedidos, mostrando el nombre del cliente y el producto del pedido.

2. **LEFT JOIN**: Escribe una consulta SQL para obtener una lista de todos los clientes y sus pedidos, mostrando el nombre del cliente y el producto. Incluye a todos los clientes, incluso si no tienen pedidos.

3. **RIGHT JOIN**: Escribe una consulta SQL para obtener una lista de todos los pedidos y el nombre del cliente que los realizó, mostrando el nombre del cliente y el producto. Incluye todos los pedidos, incluso si no tienen un cliente asociado.

---

# Ejercicio de Consultas SQL Complejas (Parte 3)

## Tabla `clientes`

| id_cliente | nombre          | ciudad     |
|------------|------------------|------------|
| 1          | Juan Pérez       | Madrid     |
| 2          | María López      | Barcelona  |
| 3          | Pedro Gómez      | Valencia   |
| 4          | Lucía Fernández  | Sevilla    |

## Tabla `pedidos`

| id_pedido | id_cliente | producto     | cantidad | fecha       |
|-----------|------------|--------------|----------|-------------|
| 1         | 1          | Laptop       | 1        | 2024-01-10  |
| 2         | 2          | Smartphone   | 2        | 2024-01-12  |
| 3         | 1          | Tablet       | 3        | 2024-02-01  |
| 4         | 3          | Auriculares  | 1        | 2024-02-15  |
| 5         | 2          | Monitor      | 1        | 2024-03-05  |

### Ejercicios:

1. Escribe una consulta SQL para actualizar la ciudad de todos los clientes que estén en **"Madrid"** o **"Barcelona"** a **"Valencia"**.

2. Escribe una consulta SQL que devuelva el nombre de los clientes y el producto de sus pedidos, ordenados por el nombre del cliente.

3. Escribe una consulta SQL para contar el número de pedidos por cliente, mostrando el nombre del cliente y la cantidad de pedidos. Incluye todos los clientes, incluso aquellos que no tienen pedidos.

4. Escribe una consulta SQL para eliminar todos los pedidos que no tienen un cliente asociado, utilizando un **RIGHT JOIN**.

---

# Ejercicios de SQL con JOINs (Parte 4)

## Tabla `clientes`

| id_cliente | nombre          | ciudad     |
|------------|------------------|------------|
| 1          | Juan Pérez       | Madrid     |
| 2          | María López      | Barcelona  |
| 3          | Pedro Gómez      | Valencia   |
| 4          | Lucía Fernández  | Sevilla    |

## Tabla `pedidos`

| id_pedido | id_cliente | producto     | cantidad | fecha       |
|-----------|------------|--------------|----------|-------------|
| 1         | 1          | Laptop       | 1        | 2024-01-10  |
| 2         | 2          | Smartphone   | 2        | 2024-01-12  |
| 3         | 1          | Tablet       | 3        | 2024-02-01  |
| 4         | 3          | Auriculares  | 1        | 2024-02-15  |
| 5         | 2          | Monitor      | 1        | 2024-03-05  |

### Ejercicios:

1. **SELECT con INNER JOIN**: Obtén el nombre de los clientes y sus productos comprados.

2. **INSERT con SELECT y INNER JOIN**: Agrega un nuevo pedido para un cliente que ya existe (por ejemplo, "Juan Pérez") y copia los detalles de otro pedido.

3. **UPDATE con LEFT JOIN**: Aumenta la cantidad de productos para todos los pedidos de clientes en **"Madrid"** en 5.

4. **DELETE con INNER JOIN**: Elimina todos los pedidos realizados por **"Pedro Gómez"**.

5. **SELECT con LEFT JOIN**: Obtén la lista de todos los clientes y sus pedidos, incluyendo aquellos que no tienen pedidos.

6. **INSERT con RIGHT JOIN**: Inserta un nuevo cliente y un pedido asociado utilizando datos de otra tabla.

7. **UPDATE con INNER JOIN**: Cambia la ciudad de los clientes que han comprado **"Monitor"** a **"Zona Premium"**.

8. **DELETE con LEFT JOIN**: Elimina los pedidos que no tienen un cliente asociado.

9. **SELECT con RIGHT JOIN**: Muestra todos los pedidos y el nombre del cliente, incluyendo pedidos que no tienen clientes asociados.

10. **INSERT con INNER JOIN**: Agrega un nuevo pedido para un cliente específico, copiando información de otro pedido.

11. **UPDATE con RIGHT JOIN**: Cambia el producto de todos los pedidos de clientes en **"Sevilla"** a **"Producto Alternativo"**.

12. **DELETE con INNER JOIN**: Elimina todos los pedidos que tienen una cantidad menor o igual a 1.

13. **SELECT con GROUP BY**: Muestra el total de pedidos por cliente.

14. **UPDATE con LEFT JOIN y GROUP BY**: Cambia la ciudad de los clientes que tienen más de 2 pedidos a **"Frecuente"**.

15. **DELETE con LEFT JOIN**: Elimina clientes que no tienen pedidos asociados.

---

# Ejercicio de Consultas SQL Complejas (Parte 5)

### Ejercicios de Funciones y Procedimientos:

1. **Crear una función que calcule el área de un círculo**:  
   Crea una función llamada `calcular_area_circulo` que reciba el radio como parámetro y devuelva el área.

2. **Crear un procedimiento para insertar un nuevo empleado**:  
   Crea un procedimiento llamado `insertar_empleado` que reciba `nombre` y `salario` y lo inserte en la tabla `empleados`.

3. **Crear una función que convierta Celsius a Fahrenheit**:  
   Crea una función llamada `celsius_a_fahrenheit` que reciba una temperatura en Celsius.

4. **Crear un procedimiento para actualizar el salario de un empleado**:  
   Crea un procedimiento `actualizar_salario` que reciba el ID y el nuevo salario.

5. **Crear una función que devuelva el número de días en un mes**:  
   Crea una función `dias_en_mes` que reciba el mes y el año.

6. **Crear un procedimiento que elimine un empleado por ID**:  
   Crea un procedimiento `eliminar_empleado` que reciba el ID.

7. **Crear una función que determine si un número es primo**:  
   Crea una función `es_primo` que reciba un número.

8. **Crear un procedimiento que liste todos los empleados**:  
   Crea un procedimiento `listar_empleados` que muestre todos los empleados.

9. **Crear una función que sume dos números**:  
   Crea una función `sumar` que reciba dos números.

10. **Crear un procedimiento que devuelva el salario promedio de los empleados**:  
   Crea un procedimiento `salario_promedio` que devuelva el salario promedio.
