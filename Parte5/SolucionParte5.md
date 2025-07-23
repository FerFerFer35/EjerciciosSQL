# Parte 5 - Ejercicio de Consultas SQL Complejas

## Crear función para calcular el área de un círculo

```sql
DELIMITER $$

CREATE FUNCTION calcular_area_circulo(radio FLOAT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN PI() * radio * radio;
END$$

DELIMITER;
```
**Explicación:** Esta función recibe el radio y devuelve el área del círculo usando la fórmula πr².

---

## Crear procedimiento para insertar un nuevo empleado

```sql
DELIMITER $$

CREATE PROCEDURE insertar_empleado(IN p_nombre VARCHAR(100), IN p_salario DECIMAL(10, 2))
BEGIN
    INSERT INTO empleados (nombre, salario) VALUES (p_nombre, p_salario);
END$$

DELIMITER;
```
**Explicación:** Procedimiento que inserta un nuevo empleado con nombre y salario en la tabla `empleados`.

---

## Crear función para convertir Celsius a Fahrenheit

```sql
DELIMITER $$

CREATE FUNCTION celsius_a_fahrenheit(temperatura_celsius FLOAT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN (temperatura_celsius * 9/5) + 32;
END$$

DELIMITER;
```
**Explicación:** Convierte una temperatura en Celsius a Fahrenheit.

---

## Crear procedimiento para actualizar salario de un empleado

```sql
DELIMITER $$

CREATE PROCEDURE actualizar_salario(IN p_id INT, IN p_nuevo_salario DECIMAL(10, 2))
BEGIN
    UPDATE empleados SET salario = p_nuevo_salario WHERE id = p_id;
END$$

DELIMITER;
```
**Explicación:** Actualiza el salario de un empleado según su ID.

---

## Crear función para obtener el número de días en un mes

```sql
DELIMITER $$

CREATE FUNCTION dias_en_mes(p_mes INT, p_anio INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DAY(LAST_DAY(STR_TO_DATE(CONCAT(p_anio, '-', p_mes, '-01'), '%Y-%m-%d')));
END$$

DELIMITER;
```
**Explicación:** Devuelve la cantidad de días que tiene un mes específico de un año determinado.

---

## Crear procedimiento para eliminar un empleado por ID

```sql
DELIMITER $$

CREATE PROCEDURE eliminar_empleado(IN p_id INT)
BEGIN
    DELETE FROM empleados WHERE id = p_id;
END$$

DELIMITER;
```
**Explicación:** Elimina un empleado de la tabla usando su ID.

---

## Crear función para determinar si un número es primo

```sql
DELIMITER $$

CREATE FUNCTION es_primo(p_numero INT) 
RETURNS TINYINT(1)
DETERMINISTIC
BEGIN
    DECLARE i INT DEFAULT 2;
    IF p_numero <= 1 THEN
        RETURN 0;
    END IF;
    WHILE i <= FLOOR(SQRT(p_numero)) DO
        IF p_numero % i = 0 THEN
            RETURN 0;
        END IF;
        SET i = i + 1;
    END WHILE;
    RETURN 1;
END$$

DELIMITER;
```
**Explicación:** Función que devuelve 1 si un número es primo, y 0 si no lo es.

---

## Crear procedimiento para listar todos los empleados

```sql
DELIMITER $$

CREATE PROCEDURE listar_empleados()
BEGIN
    SELECT * FROM empleados;
END$$

DELIMITER;
```
**Explicación:** Muestra todos los registros de la tabla `empleados`.

---

## Crear función para sumar dos números

```sql
DELIMITER $$

CREATE FUNCTION sumar(p_numero1 FLOAT, p_numero2 FLOAT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN p_numero1 + p_numero2;
END$$

DELIMITER;
```
**Explicación:** Función que recibe dos números y devuelve su suma.

---

## Crear procedimiento para obtener el salario promedio de los empleados

```sql
DELIMITER $$

CREATE PROCEDURE salario_promedio(OUT p_promedio DECIMAL(10, 2))
BEGIN
    SELECT AVG(salario) INTO p_promedio FROM empleados;
END$$

DELIMITER;
```
**Explicación:** Calcula y devuelve el salario promedio de todos los empleados.
