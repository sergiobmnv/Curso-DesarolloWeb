
/* Ejercicio en clase: Base * Exponente */

	CREATE OR REPLACE FUNCTION potencia (base IN NUMBER, exponente IN NUMBER)
    RETURN NUMBER IS
        resultado NUMBER := 1;
        iteracion NUMBER := 0;
        BEGIN
        
            iteracion := exponente;
            
           WHILE iteracion > 0 LOOP
             resultado := resultado * base;
             iteracion := iteracion - 1;
           END LOOP;
           
            RETURN resultado;
        END potencia;
        
        
        
        SELECT potencia (5, 2) FROM dual;
		

/* Ejercicio en clase: productorio */

	CREATE OR REPLACE FUNCTION productorio (n IN NUMBER)
		RETURN NUMBER IS
		
		resultado NUMBER := 1;
		numero NUMBER := 0;
		
		
		BEGIN
		
			numero := n;
			
			WHILE numero > 0 LOOP
				resultado := resultado * numero;
				numero := numero - 1;
			END LOOP;
		
			RETURN resultado;
		END productorio;       
    
 SELECT productorio (9) FROM dual;
			