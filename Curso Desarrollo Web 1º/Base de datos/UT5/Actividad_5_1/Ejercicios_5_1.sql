

/* 1. Cree una función llamada es_divisible, que devuelva 1 ó 0 si un número es o no divisible por otro, es decir, 
		si el primer número es divisible por el segundo. Para lo cual pasaremos el dividendo y el divisor como parámetros. */
		
	CREATE OR REPLACE FUNCTION es_divisible (dividendo IN NUMBER, divisor IN NUMBER)
		RETURN NUMBER IS 
			resultado NUMBER := 0;
			
		BEGIN
			IF MOD (dividendo, divisor) = 0 THEN
				resultado := 1;
		END IF;
		
		RETURN resultado;
		
	END es_divisible;
		
	--Primera Forma.
	SELECT es_divisible(4,2) FROM dual;	--Da 1.
	SELECT es_divisible(5,2) FROM dual; --Da 0.
	
	--Segunda Forma.
	SET SERVEROUTPUT ON;
	DECLARE 
		dividendo NUMBER;
		divisor NUMBER;
		resultado NUMBER;
	BEGIN
		dividendo:=&dividendo_INSERTAR;
		divisor:=&divisor_INSERTAR;
		resultado:=es_divisible(DIVIDENDO,DIVISOR);

		IF resultado = 0 THEN
			DBMS_OUTPUT.PUT_LINE('El numero '  dividendo  ' el numero divisor '  divisor  ' no son divisibles');
		ELSE
			DBMS_OUTPUT.PUT_LINE('El numero '  dividendo  ' el numero divisor '  divisor  ' son divisibles');
		END IF;

	END;

/* 2. Cree una función llamada día_semana, que nos devuelva el nombre del día de la semana según un valor de entrada numérico. 
		Así, por ejemplo, si le pasamos un 1 devolverá lunes y si le pasamos un 6 devolverá sábado. */
		
		
	CREATE OR REPLACE FUNCTION dia_semana (numeroDelDia IN NUMBER)
		RETURN VARCHAR2 IS
		
		dia VARCHAR2(100);
		
	BEGIN
		CASE numeroDelDia
			WHEN 1 THEN
				dia := 'Lunes';
			WHEN 2 THEN
				dia := 'Martes';
			WHEN 3 THEN
				dia := 'Miercoles';
			WHEN 4 THEN
				dia := 'Jueves';
			WHEN 5 THEN
				dia := 'Viernes';
			WHEN 6 THEN
				dia := 'Sabado';
			WHEN 7 THEN
				dia := 'Domingo';
		ELSE 
			dia := 'Numero del dia de la semana incorrecto';
        END CASE;
            
		RETURN dia;
	END dia_semana;
		

	--Primera Forma.
	SELECT dia_semana (1) FROM dual;
	
	--Segunda Forma.
	SET SERVEROUTPUT ON;
	DECLARE
    
		numeroDelDia NUMBER;
        dia VARCHAR2(50);
		
	BEGIN
	
		numeroDelDia := &numeroDelDia;
		dia := dia_semana(numeroDelDia);
		
		DBMS_OUTPUT.PUT_LINE('El dia ' || numeroDelDia || ' es ' || dia);
		
	END;
	
	
/* 3. Cree una función llamada mayor que devuelva el mayor de tres números pasados como parámetros. */

	CREATE OR REPLACE FUNCTION mayor (numero1 IN NUMBER, numero2 IN NUMBER, numero3 IN NUMBER)
	RETURN NUMBER IS
	
		mayor NUMBER := 0;
		
	BEGIN 
	
		IF numero1 > numero2 AND numero1 > numero3 THEN
			mayor := numero1;
		ELSIF numero2 > numero1 AND numero2 > numero3 THEN
			mayor := numero2;
		ELSIF numero3 > numero1 AND numero3 > numero2 THEN
			mayor := numero3;
			
		END IF;	
		
		RETURN mayor;
		
	END mayor;
    
	
	--Primera Forma.
    SELECT mayor (5, 8, 7) FROM dual;
    
    --Segunda Forma.
    SET SERVEROUTPUT ON;
	
	DECLARE	
    
        numero1  NUMBER;
        numero2 NUMBER;
        numero3 NUMBER;
        numeromayor NUMBER;
        
	BEGIN
		numero1  := &numero1;
		numero2  := &numero2;
		numero3  := &numero3;
		numeromayor  := mayor (numero1, numero2, numero3);
        
		DBMS_OUTPUT.PUT_LINE('El numero mayor es: ' || numeromayor);
		
	END;
    
    
/* 4. Cree un función llamada suma_numeros que devuelva la suma de los primeros n
		números enteros, siendo n un parámetro de entrada. */   
		
	CREATE OR REPLACE FUNCTION suma_enteros (n IN NUMBER) 
		RETURN NUMBER IS 
			
			suma NUMBER := 0;
			numero NUMBER := 0;
			
		BEGIN 
			
			numero := n;
			
			WHILE numero > 0 LOOP
				suma := suma + numero;
				numero := numero - 1;
			END LOOP;
			
			RETURN suma;
			
		END suma_enteros;
		
		
	
	SELECT suma_enteros (4) FROM dual;
	SELECT suma_enteros (0) FROM dual;
	SELECT suma_enteros (10) FROM dual;
		
		
		
		
		
		