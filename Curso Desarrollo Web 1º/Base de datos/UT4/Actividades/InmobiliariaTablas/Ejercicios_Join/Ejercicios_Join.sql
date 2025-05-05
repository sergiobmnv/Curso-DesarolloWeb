
--A)Obtener todos los datos de los inmuebles, incluida la descripción del tipo de inmueble.
SELECT INM. *,
    TIN.DESCRIPCION AS "DESCRIPCION DEL INMUEBLE"
FROM INMUEBLE INM, TIPO_INMUEBLE TIN
WHERE INM.CODIGO_TIPO_INMUEBLE = TIN.CODIGO_TIPO_INMUEBLE;

SELECT INM. *,
    TIN.DESCRIPCION AS "DESCRIPCION DEL INMUEBLE"
FROM INMUEBLE INM JOIN TIPO_INMUEBLE TIN
    ON INM.CODIGO_TIPO_INMUEBLE = TIN.CODIGO_TIPO_INMUEBLE;



--B)Obtener el DNI, NOMBRE, APELLIDOS de los Agentes, así como la DESCRIPCIÓN del horario de cada Agente.

SELECT AGT.DNI,
    AGT.NOMBRE,
    AGT.APELLIDOS,
    HOR.DESCRIPCION
FROM AGENTE AGT, HORARIO HOR
WHERE AGT.HORARIO_CODIGO = HOR.CODIGO;

SELECT AGT.DNI,
    AGT.NOMBRE,
    AGT.APELLIDOS,
    HOR.DESCRIPCION
FROM AGENTE AGT JOIN HORARIO HOR
        ON AGT.HORARIO_CODIGO = HOR.CODIGO;
		

/* --C) Lista las comisiones obtenidas por cada Agente, devuelve DNI, NOMBRE, TELEFONO, 
SALARIO BASE de los Agentes, así como el IMPORTE y FECHA_CALCULO 
de cada comisión de los Agentes. */

SELECT  AGT.DNI,
        AGT.NOMBRE,
        AGT.TELEFONO,
        AGT.SALARIO_BASE,
        COMI.IMPORTE,
        COMI.FECHA_CALCULO

FROM AGENTE AGT JOIN COMISION COMI
ON  AGT.DNI = COMI.AGENTE_DNI;



/* --F) Devuelve el ID_MOVIMIENTO, FECHA_MOVIMIENTO, PRECIO, ID_INMUEBLE, de todos los movimientos del Agente cuyo DNI es 05784218V,
incluida la DIRECCION y POBLACION del Inmueble del movimiento, y DESCRIPCION del Tipo de Inmueble, 
DESCRIPCION del Tipo de Movimiento, DNI y NOMBRE y APELLIDOS del Cliente, así como DNI, NOMBRE y APELLIDOS del Agente correspondiente */

SELECT MOV.ID_MOVIMIENTO,
        MOV.FECHA_MOVIMIENTO,
        MOV.PRECIO,
        MOV.ID_INMUEBLE,
        INM.DIRECCION,
        INM.POBLACION,
        TMOV.DESCRIPCION AS "DESCRIPCION TIPO MOVIMIENTO",
        CLI.DNI DNI_CLIENTE,
        CLI.NOMBRE NOMBRE_CLIENTE,
        CLI.APELLIDOS APELLIDOS_CLIENTE
FROM MOVIMIENTO MOV, AGENTE AGT, INMUEBLE INM, TIPO_INMUEBLE TMOV, CLIENTE CLI
WHERE MOV.AGENTE DNI  = AGT.DNI
        AND MOV.ID_INMUEBLE = INM.ID_INMUEBLE
        AND MOV.CODIGO_TIPO_INMUEBLE = TMOV.CODIGO_TIPO_INMUEBLE
        AND MOV.CLIENTE_DNI = CLI.DNI
        AND MOV.AGENTE_DNI = '05784218V';
		
        
--H) Obtener los datos de los agentes cuyo salario nase esta entre 1200 y 3100.
SELECT AGT.*
FROM AGENTE AGT
WHERE AGT.SALARIO_BASE BETWEEN >= 1200 AND AGT.SALARIO_BASE <= 3100;



--I) Obtener el ID_MOVIMIENTO, FECHA_MOVIMIENTO, PRECIO del cliente con numero de telefono 926213040, siempre que sean movimineto realizados en el año 2020.
SELECT MOV.ID_MOVIMIENTO,
        MOV.FECHA_MOVIMIENTO,
        MOV.PRECIO
FROM MOVIMIENTO MOV, CLIENTE CLI
WHERE MOV.CLIENTE_DNI = CLI.DNI
        AND CLI.TELEFONO = '926213040'
        AND TO_CHAR (MOV.FECHA_MOVIMIENTO, 'YYYY') = '2020';
		
--J) Obtener el precio medio de venta de todos los inmuebles sobre los que se hayan realizado algun movimiento.

SELECT AVG (INM.PRECIO_VENTA)
	FROM INMUEBLE INM, MOVIMIENTO MOV
	WHERE INM.ID_INMUEBLE = NOW.ID_INMUEBLE;
	
SELECT AVG (INM.PRECIO_VENTA)
	FROM INMUEBLE INM JOIN MOVIMIENTO MOV
		ON INM.ID_INMUEBLE = MOV.ID_INMUEBLE;
		
		
--K)Obtener ID_COMISION, IMPORTE, FECHA CALCULO, DNI AGENTE de las comisiones, ordenados de mayor a menor por el IMPORTE de la comisión.

SELECT COMI.ID_COMISION,
		COMI.IMPORTE,
		COMI.FECHA_CALCULO,
		AGT.DNI
FROM COMISION COMI, AGENTE AGT
WHERE COMI.AGENTE_DNI = AGT.DNI
	ORDER BY COMI.IMPORTE DESC;
	
	
/* --L) Aplicar una subida del 15% al precio de venta de los inmuebles de tipo TI0002. */

SELECT TIP.PRECIO_VENTA + (TIP.PRECIO_VENTA * 0.15)		
FROM INMUEBLE TIP
WHERE TIP.CODIGO_TIPO_INMUEBLE = 'TI0002';


/* d) Devuelve el número de comisiones obtenidas por cada Agente en función del DNI del Agente. */

	SELECT COUNT(1) AS CANTIDAD,
        COMI.AGENTE_DNI
	FROM COMISION COMI, AGENTE AGT
    WHERE AGT.DNI = COMI.AGENTE_DNI
	GROUP BY COMI.AGENTE_DNI;
	
/* e) Devuelve el IMPORTE de la comisión más grande obtenida por aquellos Agentes con más de 2 comisiones. De los Agentes, solo es necesario devolver el DNI del Agente. */

	SELECT MAX(COMI.IMPORTE) MAX_IMPOR,
    COMI.AGENTE_DNI DNI
	FROM COMISION COMI
	GROUP BY COMI.AGENTE_DNI
	HAVING COUNT(*) > 2
	
	
	//SUBCONSULTAS:
/* m) Borra los datos de aquellas inmobiliarias que no tengan inmuebles registrados. */
	
DELETE FROM INMOBILIARIA

WHERE ID_INMOBILIARIA NOT IN (SELECT AGT.ID_INMOBILIARIA
                                    FROM AGENTE AGT JOIN  MOVIMIENTO MOV
                                                    ON MOV.AGENTE_DNI = AGT.DNI
                                                JOIN INMUEBLE INM
                                                    ON MOV.ID_INMUEBLE = INM.ID_INMUEBLE);
                                                    
                                                    COMMIT;
													
													

											