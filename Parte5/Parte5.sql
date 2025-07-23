-- Crear una función que calcule el área de un círculo:
-- Crea una función llamada calcular_area_circulo que reciba el radio como parámetro y devuelva el área.
DELIMITER $$

CREATE FUNCTION calcular_area_circulo(radio FLOAT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN PI() * radio * radio;
END$$

DELIMITER;

-- Crear un procedimiento para insertar un nuevo empleado:
-- Crea un procedimiento llamado insertar_empleado que reciba nombre y salario y lo inserte en la tabla empleados.
DELIMITER $$

CREATE PROCEDURE insertar_empleado(IN p_nombre VARCHAR(100), IN p_salario DECIMAL(10, 2))
BEGIN
    INSERT INTO empleados (nombre, salario) VALUES (p_nombre, p_salario);
END$$

DELIMITER;

-- Crear una función que convierta Celsius a Fahrenheit:
-- Crea una función llamada celsius_a_fahrenheit que reciba una temperatura en Celsius.
DELIMITER $$

CREATE FUNCTION celsius_a_fahrenheit(temperatura_celsius FLOAT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN (temperatura_celsius * 9/5) + 32;
END$$

DELIMITER;

-- Crear un procedimiento para actualizar el salario de un empleado:
-- Crea un procedimiento actualizar_salario que reciba el ID y el nuevo salario.
DELIMITER $$

CREATE PROCEDURE actualizar_salario(IN p_id INT, IN p_nuevo_salario DECIMAL(10, 2))
BEGIN
    UPDATE empleados SET salario = p_nuevo_salario WHERE id = p_id;
END$$

DELIMITER;

-- Crear una función que devuelva el número de días en un mes:
-- Crea una función dias_en_mes que reciba el mes y el año.
DELIMITER $$

CREATE FUNCTION dias_en_mes(p_mes INT, p_anio INT) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN DAY(LAST_DAY(STR_TO_DATE(CONCAT(p_anio, '-', p_mes, '-01'), '%Y-%m-%d')));
END$$

DELIMITER;

-- Crear un procedimiento que elimine un empleado por ID:
-- Crea un procedimiento eliminar_empleado que reciba el ID.
DELIMITER $$

CREATE PROCEDURE eliminar_empleado(IN p_id INT)
BEGIN
    DELETE FROM empleados WHERE id = p_id;
END$$

DELIMITER;

-- Crear una función que determine si un número es primo:
-- Crea una función es_primo que reciba un número.
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

-- Crear un procedimiento que liste todos los empleados:
-- Crea un procedimiento listar_empleados que muestre todos los empleados.
DELIMITER $$

CREATE PROCEDURE listar_empleados()
BEGIN
    SELECT * FROM empleados;
END$$

DELIMITER;

-- Crear una función que sume dos números:
-- Crea una función sumar que reciba dos números.
DELIMITER $$

CREATE FUNCTION sumar(p_numero1 FLOAT, p_numero2 FLOAT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN p_numero1 + p_numero2;
END$$

DELIMITER;

-- Crear un procedimiento que devuelva el salario promedio de los empleados:
-- Crea un procedimiento salario_promedio que devuelva el salario promedio.
DELIMITER $$

CREATE PROCEDURE salario_promedio(OUT p_promedio DECIMAL(10, 2))
BEGIN
    SELECT AVG(salario) INTO p_promedio FROM empleados;
END$$

DELIMITER;