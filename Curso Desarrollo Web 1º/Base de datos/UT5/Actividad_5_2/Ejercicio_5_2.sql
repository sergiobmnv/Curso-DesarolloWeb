


/* 1. Hacer una función suma_fracciones que devuelva la suma de los 1/n. Es decir: 1/1 + ½
	+ 1/3 + … 1/n siendo n el parámetro de entrada. Tenga en cuenta que n no puede ser cero. */
	
	CREATE OR REPLACE FUNCTION sumaFracciones (n IN NUMBER) 
	RETURN NUMBER IS
	
		total NUMBER := 0;
		
	BEGIN 
		
		for i in 1..n LOOP
			total := total + 1/i;
		END LOOP;
		
		return total;
	END sumaFracciones;
    
    SELECT sumaFracciones (3) FROM dual;
    
SET SERVEROUTPUT ON;

    DECLARE
        
        n NUMBER;
        total NUMBER;
    
    BEGIN
        
        n := &numeroDeVeces;
        total := sumaFracciones(n);
        
        DBMS_OUTPUT.PUT_LINE('La suma de la fraccion seria ' || total);
    
    END sumaFracciones;
    
	
	
/* 2. Crear una función llamada palíndromo que, pasándole una cadena de texto como parámetro de entrada, 
	devuelva esa misma cadena dada la vuelta como parámetro de salida. Es decir, si le pasamos como parámetro ‘Hola’ nos debe mostrar ‘aloH’.
	Ayuda: Mira las funciones CHAR_LENGTH y SUBSTRING de MySQL */
	
	CREATE OR REPLACE FUNCTION palindromo (texto IN VARCHAR2) 
	RETURN VARCHAR2 IS 
	
		resultado VARCHAR2(200);

	BEGIN
	
		FOR i IN REVERSE 1..LENGTH(texto) LOOP
		resultado := resultado || SUBSTR(texto,i,1);
		
		END LOOP;
		
		RETURN resultado;
        
	END palindromo;
    
    SELECT palindromo ('texto') FROM DUAL;
    
    
    
    SET SERVEROUTPUT ON;
    
    DECLARE 
    
        palabra VARCHAR2(200);
        alreves VARCHAR2(200);
    
    BEGIN
        
        palabra := '&palabra';
        alreves := palindromo(palabra);
        
        DBMS_OUTPUT.PUT_LINE('La palabra ' || palabra || ' al reves es ' || alreves );
        
    END palindromo;
	
	
/* 3. Crea una función llamada diferencia_fechas, que pasándole dos fechas nos devuelva el número de años completos que hay entre dichas fechas. 
	Usa las funciones YEAR, MONTH y DAY. Ejemplo formato fecha '1999-06-07' */
	
	
		CREATE OR REPLACE FUNCTION DIFERENCIA_FECHAS(fecha1 IN DATE, fecha2 IN DATE)
	RETURN NUMBER IS
		dif int default 0;
		f1 Date default fecha1; -- fecha mayor
		f2 Date default fecha2; -- fecha menor
		-- También se podrían declarar las fecha de la siguiente forma
		--f1 DATE := fecha1; -- fecha mayor
		--f2 DATE := fecha2; -- fecha menor
	BEGIN

		IF (f1 < f2) THEN
			f1 := fecha2;
			f2 := fecha1;
		END IF;
	 
		dif := TO_NUMBER(TO_CHAR(f1, 'YYYY')) - TO_NUMBER(TO_CHAR(f2, 'YYYY'));

		IF dif > 0 THEN
			IF TO_CHAR(F1, 'MM') = TO_CHAR(F2, 'MM') THEN
				IF TO_NUMBER(TO_CHAR(f1, 'DD')) < TO_NUMBER(TO_CHAR(f2, 'DD')) THEN
					dif := dif - 1 ;
				END IF;
			ELSIF TO_NUMBER(TO_CHAR(f1, 'MM')) < TO_NUMBER(TO_CHAR(f2, 'MM')) THEN
				dif := dif - 1;
			END IF;
		END IF;
		
		RETURN dif;
	END DIFERENCIA_FECHAS;
	---------------------------------------------------------------
	SELECT DIFERENCIA_FECHAS('15/04/2024','14/03/2022') FROM DUAL;
	---------------------------------------------------------------

	SET SERVEROUTPUT ON;
	DECLARE
		fecha1 DATE;
		fecha2 DATE;
		resultado NUMBER;
	BEGIN
		fecha1 := '&fechaInsertar1';
		fecha2 := '&fechaInsertar2';

		resultado := DIFERENCIA_FECHAS(fecha1, fecha2);
		DBMS_OUTPUT.PUT_LINE('La diferencia entre las fechas es de ' || resultado || ' años');
	END;
	