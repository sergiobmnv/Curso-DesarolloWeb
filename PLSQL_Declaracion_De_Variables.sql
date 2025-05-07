
-- Cuando una funcion es DETERMINISTIC o NOT DETERMINISTIC

	-- Es DETERMINISTIC cuando el resultado esperado es simpre lo mismo por ejemplo en una suma, el resultado va a ser el mismo siempre.
	-- Es NOT DETERMINISTIC cuando el resultado puede variar, por ejemplo si un usuario hace una reserva hoy, alomejor dentro de dos dias hace mas reservas y cambia el resultado.

----------------------------------------------------------------------------------------------------------------------------

-- CONCAT ()

	-- Se usa para concatenar caracteres, en caso de que se quiera mostrar se usara junto con el select.

----------------------------------------------------------------------------------------------------------------------------
	-- Declaracion de variables (Van siempre arriba del todo).
	
		DECLARE nombre_variable [, nombre_variable] tipo_variable [DEFAULT valor];
		
----------------------------------------------------------------------------------------------------------------------------	
	-- Asignacion de valor a una variable directamente.
	
		SET nombre_variable = valor_variable;
		
----------------------------------------------------------------------------------------------------------------------------
	-- Asignacion de valor a una o mas variables como resultado de una consulta.
	
		SELECT campo1, campo2 INTO variable1, variable2
		FROM nombre_table WHERE....
	
----------------------------------------------------------------------------------------------------------------------------
	-- Sentencias IF:
	
		IF condicion THEN 
			sentencias;
		[ELSEIF condicion2 THEN 
			sentencias;]
		[ELSE 
			sentencias;]
		END IF
		
----------------------------------------------------------------------------------------------------------------------------
	-- Sentencia CASE:
	
		CASE variable 
			WHEN valor1 THEN
				sentencias;
			[WHEN valor2 THEN 
				sentencias;]
			[ELSE 
				sentencias;]
			END CASE
			
----------------------------------------------------------------------------------------------------------------------------
	-- Sentencia LOOP:
	
		[etiqueta_inicio: ] LOOP
			sentencias;
		END LOOP [etiqueta fin]
		
	-- Sentencia LEAVE:
		
		LEAVE etiqueta;
		
----------------------------------------------------------------------------------------------------------------------------
	-- Sentencia REPEAT:
	
		[etiqueta_inicio:] REPEAT
			sentencias;
		UNTIL condicion
		END REPEAT [etiqueta_fin]
		
----------------------------------------------------------------------------------------------------------------------------
	-- Sentencia WHILE:
	
		 WHILE condicion DO
			sentencias;
		END WHILE

----------------------------------------------------------------------------------------------------------------------------
	-- Crear un procedimiento:
	
		-- Esto hace que el ; por defecto del sql se quite para que el sql no pille el ; de las instrucciones.
		DELIMITER $$
		CREATE PROCEDURE SUMA_NUMEROS (IN NUMERO1 INT, IN NUMERO2 INT, OUT SUMA INT)
		BEGIN
			SET SUMA = NUMERO1 + NUMERO2;
		END $$
		DELIMITER ;


		-- Llamar a un procedimiento:
		CALL SUMA_NUMEROS (1, 8, @SALIDA_SUMA);


		-- Printear el resultado de la suma.
		SELECT @SALIDA_SUMA;

		DROP PROCEDURE SUMA_NUMEROS;
		
		
----------------------------------------------------------------------------------------------------------------------------
	-- Crear Funcion:
	
		DELIMITER $$
		CREATE FUNCTION SUMAR_FUNCION(NUMERO1 INT, NUMERO2 INT)
		RETURNS INT DETERMINISTIC
		BEGIN
			DECLARE SUMA INT DEFAULT 0;
			SET SUMA = NUMERO1 + NUMERO2;
				
			RETURN SUMA;
		END $$

		DELIMITER ;

		SELECT SUMAR_FUNCION(1, 3);
----------------------------------------------------------------------------------------------------------------------------