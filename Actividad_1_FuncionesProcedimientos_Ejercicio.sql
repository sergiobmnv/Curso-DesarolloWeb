CREATE DATABASE FUNCIONES_Y_PROCEDIMIENTOS;
USE FUNCIONES_Y_PROCEDIMIENTOS;

-- 1. Crea una función llamada es_divisible, que devuelva 1 ó 0 si un número es o no divisible por otro, 
-- 	  es decir, si el primer número es divisible por el segundo. Para lo cual pasaremos el dividendo y el divisor como parámetros.

DELIMITER $$
CREATE FUNCTION ES_DIVISIBLE (dividendo INT, divisor INT)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE RESULTADO VARCHAR(50);
    
	IF divisor = 0 THEN
		SET RESULTADO = 'No se puede dividir por cero';
	ELSEIF dividendo % divisor = 0 THEN
		SET resultado = 'Es divisible';
	ELSE
		SET resultado = 'No es divisible';
	END IF;
	RETURN resultado;
END $$

DELIMITER ;
SELECT ES_DIVISIBLE(4,2);
DROP FUNCTION ES_DIVISIBLE;

-- 2. Crea una función llamada día_semana, que nos devuelva el nombre del día de la semana según un 
--    valor de entrada numérico. Así, por ejemplo, si le pasamos un 1 devolverá lunes y si le pasamos un 6 devolverá sábado.

DELIMITER $$
CREATE FUNCTION DIA_SEMANA (DIA INT)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE RESULTADO VARCHAR(50);
    
    IF DIA = 1 THEN
		SET RESULTADO = 'Lunes';
	ELSEIF DIA = 2 THEN
		SET RESULTADO = 'Martes';
    ELSEIF DIA = 3 THEN
		SET RESULTADO = 'Miercoles';
	ELSEIF DIA = 4 THEN
		SET RESULTADO = 'Jueves';
	ELSEIF DIA = 5 THEN
		SET RESULTADO = 'Viernes';
	ELSEIF DIA = 6 THEN
		SET RESULTADO = 'Sabado';
	ELSEIF DIA = 7 THEN
		SET RESULTADO = 'Domingo';
	RETURN RESULTADO;
    ELSE 
		SET RESULTADO = 'Numero no valido';
	END IF;
    RETURN RESULTADO;
END $$

DELIMITER ;
SELECT DIA_SEMANA (9);
DROP FUNCTION DIA_SEMANA;



-- 3. Crea una función llamada mayor que devuelva el mayor de tres números pasados como parámetros.

DELIMITER $$
CREATE FUNCTION MAYOR_DE_TRES(NUMERO1 INT, NUMERO2 INT, NUMERO3 INT)
RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE RESULTADO VARCHAR(50);
    
    IF NUMERO1 >= NUMERO2 AND NUMERO1 >= NUMERO3 THEN 
		SET RESULTADO = CONCAT("El numero ", numero1, " es el mayor");
	ELSEIF NUMERO2 >= NUMERO1 AND NUMERO2 >= NUMERO3 THEN 
		SET RESULTADO = CONCAT("El numero ", numero2, " es el mayor");
	ELSEIF NUMERO3 >= NUMERO1 AND NUMERO3 >= NUMERO2 THEN
		SET RESULTADO = CONCAT("El numero ", numero3, " es el mayor");
	ELSE 
		SET RESULTADO = 'Error';
	END IF;
	RETURN RESULTADO;
END $$

DELIMITER ;

SELECT MAYOR_DE_TRES(5,50,40) AS RESULTADO_MAYOR;
DROP FUNCTION MAYOR_DE_TRES;


-- 4. Crea un función llamada suma_numeros que devuelva la suma de los primeros números enteros, siendo n un parámetro de entrada.

DELIMITER $$
CREATE FUNCTION SUMA_NUMEROS (n INT)
RETURNS INT DETERMINISTIC
BEGIN
	DECLARE suma INT DEFAULT 0;
    DECLARE i INT DEFAULT 1;
    
    WHILE i <= n DO
    SET suma = suma + i;
        SET i = i + 1;
    END WHILE;

    RETURN suma;
END $$

DELIMITER ;
SELECT suma_numeros(5);
DROP FUNCTION SUMA_NUMEROS;


-- 5. Crea un procedimiento que, pasado un número como parámetro de entrada, 
--    muestre por pantalla la tabla de multiplicar de ese número, desde el 1 hasta el 10.

DELIMITER $$
CREATE PROCEDURE TABLA_MULTIPLICAR (n INT)
BEGIN 
	DECLARE i INT DEFAULT 1;
    DECLARE multiplicacion INT;
    DECLARE resultado VARCHAR(250) DEFAULT '';
    
    WHILE i <= 10 DO
		SET multiplicacion = n * i;
        SET resultado = CONCAT(resultado , n , ' X ', i , ' = ', multiplicacion ); 
        SET i = i + 1;
	END WHILE;
    SELECT resultado;
END $$

DELIMITER ;
CALL TABLA_MULTIPLICAR(5);
DROP PROCEDURE TABLA_MULTIPLICAR;


-- 6. Crea un procedimiento que muestre por pantalla las tablas de multiplicar de todos los números del 1 al 10.

DROP PROCEDURE TABLAS_DE_MULTIPLICAR;
DELIMITER $$
CREATE PROCEDURE TABLAS_DE_MULTIPLICAR()
BEGIN
DECLARE n INT DEFAULT 1;          -- Controlador para el número de la tabla (del 1 al 10)
    DECLARE i INT DEFAULT 1;          -- Controlador para el multiplicador (del 1 al 10)
    DECLARE resultado, resultadoFinal VARCHAR(2000) DEFAULT '';   -- Variable para almacenar el resultado de la multiplicación
    
    -- Bucle para recorrer las tablas de multiplicar del 1 al 10
    WHILE n <= 10 DO

        -- Bucle para realizar las multiplicaciones de cada número
        SET i = 1;  -- Resetear el contador i para cada nueva tabla
        WHILE i <= 10 DO
            -- Concatenar y mostrar el resultado de la multiplicación
            SET resultado = CONCAT(resultado, n, ' x ', i, ' = ', (n * i), ' ; ');
            
            SET i = i + 1;  -- Incrementar el multiplicador
        END WHILE;
        SELECT resultado;
        SET n = n + 1;  -- Incrementar n para pasar a la siguiente tabla
    END WHILE;
    
END $$
CALL TABLAS_DE_MULTIPLICAR();


-- 7. Hacer una función suma_fracciones que devuelva la suma de los 1/n. Es decir: 1 /1 + ½ + 1 /3 + … 1 /n siendo n el parámetro de entrada. 
-- 	  Tenga en cuenta que n no puede ser cero.

DELIMITER $$ 
CREATE FUNCTION SUMA_FRACCIONES(n INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE suma DECIMAL(20,10) DEFAULT 0;
	DECLARE resultado VARCHAR(100);
    
	IF n <= 0 THEN
		SET resultado = 'n debe ser mayor que cero';
	ELSE
		WHILE i <= n DO
			SET suma = suma + (1 / i);
			SET i = i + 1;
		END WHILE;
		SET resultado = CONCAT('La suma de las fracciones hasta 1/', n, ' es: ', FORMAT(suma, 10));
	END IF;
	
	RETURN resultado;
END $$
DELIMITER ;

SELECT SUMA_FRACCIONES(5);
DROP FUNCTION SUMA_FRACCIONES;



-- 8. Crear una función llamada palíndromo que, pasándole una cadena de texto como parámetro de entrada, 
-- 	  devuelva esa misma cadena dada la vuelta como parámetro de salida. Es decir, si le pasamos como parámetro ‘Hola’ nos debe mostrar ‘aloH’.


DELIMITER $$
CREATE FUNCTION PALINDROMO(cadena VARCHAR(100))
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	DECLARE longitud INT;
	DECLARE i INT;
	DECLARE cadena_invertida VARCHAR(100) DEFAULT '';
    
	SET longitud = LENGTH(cadena);
	SET i = longitud;
    
	WHILE i > 0 DO
		SET cadena_invertida = CONCAT(cadena_invertida, SUBSTRING(cadena, i, 1));
		SET i = i - 1;
	END WHILE;
	
	RETURN cadena_invertida;
END $$

DELIMITER ;

SELECT PALINDROMO('Hola');
DROP FUNCTION PALINDROMO;


-- 9. Crea una función llamada diferencia_fechas, que pasándole dos fechas nos devuelva el número de años completos que hay entre dichas fechas.

DELIMITER $$

CREATE FUNCTION DIFERENCIA_FECHAS(fecha1 DATE, fecha2 DATE)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	DECLARE años INT;
	DECLARE resultado VARCHAR(100);
    
	-- Calcular la diferencia absoluta en años completos usando TIMESTAMPDIFF
	SET años = ABS(TIMESTAMPDIFF(YEAR, fecha1, fecha2));
    
	SET resultado = CONCAT('La diferencia en años completos entre las fechas es: ', años);
    
	RETURN resultado;
END $$

DELIMITER ;

SELECT DIFERENCIA_FECHAS('2000-05-06', '2025-05-06');
DROP FUNCTION DIFERENCIA_FECHAS;


