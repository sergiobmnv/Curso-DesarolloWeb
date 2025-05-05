
/* 1. Crear una tabla VENDEDORES, compuesta por tres columnas: nº empleado, salario y comisión. 
	Hacer un programa PL/SQL1que para todos los empleados de la tabla EMP que tengan comisión no 
	nula los inserte en la tabla creada anteriormente. */
	
	BEGIN
	INSERT INTO VENDEDORES(EMPNO, SAL, COMM)
		SELECT EMPE.EMPNO,
				EMPE.SAL,
				EMPE.COMM 
		FROM EMP EMPE 
		WHERE EMPE.COMM IS NOT NULL;
	END;
	
/* 2. Actualizar los vendedores con una comisión mayor que 350$ con un incremento del 15% de su salario. 
	Si la operación afecta a más de tres empleados, deshacer la transacción, en cualquier otro caso validar la transacción. 
	Introducir en la tabla TEMP la operación que se ha realizado. NOTA: Para este ejercicio use la función SQL%ROWCOUNT, que 
	determina cuantos registros se han modificado/eliminado/intertado tras realizar una operación CRUD. */
	
	DECLARE
    vcount NUMBER;
	BEGIN
    
    UPDATE VENDEDORES
    SET Sal = Sal * 1.15
    WHERE Comm > 350;
    
    
    vcount := SQL%ROWCOUNT;
    
    IF v_count > 3 THEN
        ROLLBACK;
        INSERT INTO TEMP (Codigo, Mensaje)
        VALUES (1, 'Transacción deshecha: más de 3 empleados afectados');
    ELSE
        COMMIT;
        INSERT INTO TEMP (Codigo, Mensaje)
        VALUES (0, 'Transacción confirmada: ' || vcount || ' empleados actualizados');
    END IF;
	END;


/* 3. Actualizar el trabajo a DIRECTOR a todos aquellos empleados cuyo salario sea mayor que 2000$. 
	Almacenar el número de empleados actualizados por la operación en la tabla TEMP. Si los afectados son más 
	de cinco personas, borrar los empleados cuyo salario sea mayor que 3000$, insertar en la tabla TEMP el número de 
	empleados borrados y validar la transacción. NOTA: Para este ejercicio use la función SQL%ROWCOUNT, que determina 
	cuantos registros se han modificado/eliminado/intertado tras realizar una operación CRUD.  */


	DECLARE
    vcount_update NUMBER;
    vcount_delete NUMBER;
	BEGIN
    
    UPDATE EMP
    SET JOB = 'DIRECTOR'
    WHERE SAL > 2000;
    
    
    vcount_update := SQL%ROWCOUNT;
    
    
    INSERT INTO TEMP (Codigo, Mensaje)
    VALUES (0, 'Empleados actualizados a DIRECTOR: ' || vcount_update);
    
    
    IF vcount_update > 5 THEN
        
        DELETE FROM EMP
        WHERE SAL > 3000;
        
        
        vcount_delete := SQL%ROWCOUNT;
        
        
        INSERT INTO TEMP (Codigo, Mensaje)
        VALUES (1, 'Empleados borrados con salario > 3000$: ' || vcount_delete);
    END IF;

    COMMIT;
	END;
	
	
/* 4. Insertar en la tabla TEMP 100 filas. En la primera columna se insertará un índice secuencial (1, 2, 3...) 
		y en la segunda columna un comentario indicando si el número generado es par o impar. */
		
	DECLARE
    v_index NUMBER := 1;
    v_comment VARCHAR2(20);
	BEGIN
    FOR i IN 1..100 LOOP
        
        IF MOD(i, 2) = 0 THEN
            v_comment := 'Número par';
        ELSE
            v_comment := 'Número impar';
        END IF;
        
        
        INSERT INTO TEMP (Codigo, Mensaje)
        VALUES (v_index, v_comment);
        
        
        v_index := v_index + 1;
    END LOOP;
	
    COMMIT;
	END;	
		

/* 5. Crear una tabla MAS_PAGADOS, compuesta de dos columnas, nombre y salario. Insertar en esta tabla el nombre 
	y el salario de los cinco empleados mejor pagados de la tabla EMP. Lo desarrollare en clase.
	
		CREATE TABLE mas_pagados (
		Nombre VARCHAR2 (10),
		Salario NUMBER (7,2));		*/
		
		BEGIN
    INSERT INTO MAS_PAGADOS 
        SELECT *
        FROM (
                SELECT *
                FROM EMP
                ORDER BY EMP.SAL DESC
            )A
        WHERE ROWNUM <=5;
	      
END;
		
/* 6. Realizar un bloque PL/SQL en el que se determine el total de ganancias de los empleados (salario y comisión) 
	para el departamento 20, cuantos empleados de este departamento tienen su salario por encima de 2000$ y cuantos 
	tienen la comisión mayor que su salario. */
	
	DECLARE
    vtotal_ganancias NUMBER(10, 2) := 0;
    vsalario_mayor_2000 NUMBER := 0;
    vcomision_mayor_salario NUMBER := 0;
	BEGIN
    
    FOR rec IN (SELECT SAL, COMM FROM EMP WHERE DEPTNO = 20) LOOP
        
        IF rec.SAL > 2000 THEN
            vsalario_mayor_2000 := vsalario_mayor_2000 + 1;
        END IF;
        
        IF NVL(rec.COMM, 0) > rec.SAL THEN
            vcomision_mayor_salario := vcomision_mayor_salario + 1;
        END IF;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('Total de ganancias para el departamento 20: ' || v_total_ganancias);
    DBMS_OUTPUT.PUT_LINE('Empleados con salario mayor a 2000$: ' || v_salario_mayor_2000);
    DBMS_OUTPUT.PUT_LINE('Empleados con comisión mayor que el salario: ' || v_comision_mayor_salario);
	END;
	
		
/* 7. Calcular por medio de un bloque PL/SQL anónimo el total de ganancias de los empleados (salario y comisión) y 
		cuántos de éstos tienen un salario superior a 2000$ para todos los departamentos de la empresa.
			Almacenar el resultado en la tabla TEMP2. Lo desarrollare en clase.
			
		CREATE TABLE temp2 (
		Código: NUMBER (5),
		Importe: NUMBER (7,2),
		Mensaje: VARCHAR2 (50));*/
		
		
		set serveroutput on ;

		begin

		for i in (select sum (nvl(empe.comm,0))+sum (empe.sal) ganancias,
					empe.deptno
				from emp empe
				group by empe.deptno)loop

				insert into temp2 values (1,i.ganancias,'ganancias total por departamento' i.deptno);
			 end loop;
			 commit;

		for j in (
			select empe.sal sal,
				empe.deptno,
				empe.ename
			from emp empe
			where empe.sal > 2000 )loop

			insert into temp2 values (1,j.sal,j.ename  'tiene un salario superior a 2000');

			end loop;

		    commit;

		end;

/* 15. Incrementar la comisión, en función del salario, de los empleados de Boston y Nueva York 
	   según su antigüedad y cargo, según la siguiente tabla:  */
	   
	   DECLARE
			CURSOR cCURSOR IS
				SELECT DEPT.LOC CIUDAD,
						EMP.SAL SALARIO,
						EMP.JOB CARGO,
						EMP.HIREDATE FECHA_CONTRATACION,
						EMP.EMPNO NUM_EMPLEADO
					FROM EMP EMP, DEPT DEPT
					WHERE EMP.DEPTNO = DEPT.DEPTNO
						AND DEPT.LOC IN ('BOSTON', 'NEW YORK');
		
		variableINTO cCURSOR%ROWTYPE;
		antiguedad NUMBER := 0;
		incremento := 0;
		
		BEGIN 
			OPEN cCURSOR;
			
			LOOP 
				FETCH cCURSOR INTO variableINTO;
				EXIT WHEN cCURSOR%FOUND;
				
				IF variableINTO.CIUDAD = 'Boston' THEN
				
				antiguedad := TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) - TO_NUMBER(TO_CHAR(variableINTO));
				
				ELSIF antiguedad >= 10 AND antiguedad <= 20 THEN
					incremento