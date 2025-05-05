

/*	Usando la base de datos de reservas, crea una función o procedimiento en MYSQL que cree una reserva 
	para las pistas de baloncesto ubicadas en polideportivos de la ciudad de Zaragoza, para el usuario con DNI=’ MUUCLKSD8’.
	Recuerda que, por cada reserva, se deben registrar datos en las tablas RESERVA y USUARIO_RESERVA;
	Por cada reserva creada debe mostrar mediante una SELECT el NOMBRE, APELLIDOS del usuario, el CODIGO y 
	PRECIO de la pista, así como el NOMBRE y DIRECCION del polideportivo. Usa la función concat() para mostrar toda esta información de 
	la siguiente forma: El usuario [NOMBRE] [APELLIDOS] ha reservado la pista [CODIGO] de baloncesto al [PRECIO] en el polideportivo [NOMBRE] ubicado en [DIRECCION] de Zaragoza.
	Usa variables, cursores, excepciones, así como las estructuras de control de flujo que necesites. */
	
	DROP FUNCTION RESERVA_PISTAS;
	
	CREATE OR REPLACE PROCEDURE RESERVA_PISTAS IS
	
		id_usuario USUARIO.ID_USUARIO%TYPE;
		nombre USUARIO.NOMBRE%TYPE;
		apellido USUARIO.APELLIDOS%TYPE;
		v_id_reserva NUMBER := 0;
		
		CURSOR reservaBaloncestoZaragoza IS	
		
			SELECT PISTA.PRECIO AS PRECIO_PISTA, 
					PISTA.CODIGO AS CODIGO_PISTA,
					PISTA.ID_PISTA AS ID_PISTA,
					POLI.NOMBRE AS NOMBRE_POLI,
					POLI.DIRECCION AS DIRECCION_POLI
					
			FROM PISTA PISTA, POLIDEPORTIVO POLI
			
			WHERE PISTA.ID_POLIDEPORTIVO = POLI.ID_POLIDEPORTIVO
					AND POLI.CIUDAD = 'Zaragoza'
					AND PISTA.TIPO = 'baloncesto';
				
		variableINTO reservaBaloncestoZaragoza%ROWTYPE;
				
		BEGIN 
		
			SELECT USU.NOMBRE,
					USU.APELLIDOS,
					USU.ID_USUARIO
					
			INTO nombre,
				 apellido,
				 id_usuario
				 
			FROM USUARIO AS USU
			WHERE USU.DNI = 'MUUCLKSD8':
						
			OPEN reservaBaloncestoZaragoza;
			LOOP 
				FETCH reservaBaloncestoZaragoza INTO variableINTO;
				EXIT WHEN reservaBaloncestoZaragoza%NOTFOUND;
				
				SELECT MAX(RESERVA.ID_RESERVA)
				INTO v_id_reserva
				FROM RESERVA RESERVA;
				
				INSERT INTO RESERVA(ID_RESERVA, FECHA_RESERVA, FECHA_USO, PRECIO, ID_PISTA)
						VALUES (v_id_reserva + 1, SYSDATE - 2, SYSDATE, variableINTO.PRECIO);
						
				INSERT INTO USUARIO_RESERVA(ID_USUARIO, ID_RESERVA)
						VALUES (v_id_reserva + 1, SYSDATE - 2, SYSDATE, variableINTO.PRECIO);
				COMMIT;
				DBMS_OUTPUT.PUT_LINE('El usuario' || nombre || apellido || 'ha reservado la pista' || variableINTO.CODIGO_PISTA || 'de baloncesto al' || variableINTO.PRECIO_PISTA  || 'en 
										el polideportivo' || variableINTO.NOMBRE_POLI || 'ubicado en' || variableINTO.DIRECCION_POLI  || 'de Zaragoza.');
			END LOOP;
			CLOSE reservaBaloncestoZaragoza;
					
		END RESERVA_PISTAS;
	
	SET SERVEROUTPUT ON;
		
		BEGIN
			RESRVA_PISTA;
		END;