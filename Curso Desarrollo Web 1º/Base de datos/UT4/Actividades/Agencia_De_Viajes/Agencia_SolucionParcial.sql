-- 2. Crea el script para generar la siguiente tabla:
CREATE TABLE TIPO_TRANSPORTE (
	TIPO_TRANSPORTE VARCHAR2(10) NOT NULL,
 	NOMBRE VARCHAR2(50) NOT NULL,
 	DESCRIPCION VARCHAR2(100),
 	CONSTRAINT PK_TIPO_TRANSPORTE PRIMARY KEY (TIPO_TRANSPORTE)
);

COMMENT ON TABLE TIPO_TRANSPORTE IS 'Datos de tipos de transporte';
COMMENT ON COLUMN TIPO_TRANSPORTE.TIPO_TRANSPORTE IS 'Identificador del tipo de transporte';
COMMENT ON COLUMN TIPO_TRANSPORTE.NOMBRE IS 'Nombre del tipo de transporte';
COMMENT ON COLUMN TIPO_TRANSPORTE.DESCRIPCION IS 'Descripcion del tipo de transporte';

CREATE TABLE TRANSPORTE (
	ID_TRANSPORTE NUMBER NOT NULL,
 	ORIGEN VARCHAR2(50) NOT NULL,
 	DESTINO VARCHAR2(100),
 	TIPO_TRANSPORTE VARCHAR(10) NOT NULL, 
 	CONSTRAINT PK_TRANSPORTE PRIMARY KEY (ID_TRANSPORTE),
 	CONSTRAINT FK_TRANSPORTE_TIPO_TRANSPORTE FOREIGN KEY (TIPO_TRANSPORTE) REFERENCES TIPO_TRANSPORTE(TIPO_TRANSPORTE)
);

COMMENT ON TABLE TRANSPORTE IS 'Datos de los transportes';
COMMENT ON COLUMN TRANSPORTE.ID_TRANSPORTE IS 'Identificador del transporte';
COMMENT ON COLUMN TRANSPORTE.ORIGEN IS 'Origen del transporte';
COMMENT ON COLUMN TRANSPORTE.DESTINO IS 'Destino del transporte';
COMMENT ON COLUMN TRANSPORTE.TIPO_TRANSPORTE IS 'Tipo del transporte';

CREATE SEQUENCE SEC_TRANSPORTE
INCREMENT BY 1
START WITH 1
MAXVALUE 999999999
NOCACHE
ORDER;


-- 3. Realiza las siguientes modificaciones de estructura en la base de datos
ALTER TABLE PRODUCTO 
	ADD ID_TRANSPORTE NUMBER;
COMMENT ON COLUMN PRODUCTO.ID_TRANSPORTE IS 'Producto de tipo Transporte';

ALTER TABLE PRODUCTO 
	ADD CONSTRAINT FK_PRODUCTO_ID_TRANSPORTE FOREIGN KEY(ID_TRANSPORTE) REFERENCES TRANSPORTE(ID_TRANSPORTE);

ALTER TABLE CLIENTE 
	MODIFY NOMBRE VARCHAR2(100) NOT NULL;


-- 5. Introduce los siguientes datos en cada tabla.
INSERT INTO TIPO_TRANSPORTE (TIPO_TRANSPORTE, NOMBRE, DESCRIPCION) 
VALUES ('TR00000001','Autobus','Transporte en autobus');
INSERT INTO TIPO_TRANSPORTE (TIPO_TRANSPORTE, NOMBRE, DESCRIPCION) 
VALUES ('TR00000002','Tren','Transporte en tren');
INSERT INTO TIPO_TRANSPORTE (TIPO_TRANSPORTE, NOMBRE, DESCRIPCION) 
VALUES ('TR00000003','Avion',null);
INSERT INTO TRANSPORTE (ID_TRANSPORTE, ORIGEN, DESTINO, TIPO_TRANSPORTE) 
VALUES (SEC_TRANSPORTE.NEXTVAL, 'Valladolid','Madrid','TR00000002');
INSERT INTO TRANSPORTE (ID_TRANSPORTE, ORIGEN, DESTINO, TIPO_TRANSPORTE) 
VALUES (SEC_TRANSPORTE.NEXTVAL, 'Ciudad Real','Toledo','TR00000001');
INSERT INTO TRANSPORTE (ID_TRANSPORTE, ORIGEN, DESTINO, TIPO_TRANSPORTE) 
VALUES (SEC_TRANSPORTE.NEXTVAL, 'Ciudad Real','Alicante','TR00000002');

COMMIT;



-- 6. Actualiza a 3 estrellas la categoría del hotel reservado por el cliente Juan Murray.

	-- Con Subconsultas.
		UPDATE HOTEL
		SET CATEGORIA = 3
		WHERE ID_HOTEL in (SELECT HOT.ID_HOTEL
								FROM RESERVA RES, PRODUCTO PROD, HOTEL HOT, CLIENTE CLI
								WHERE RES.ID_PRODUCTO = PROD.ID_PRODUCTO
										AND PROD.ID_HOTEL = HOT.ID_HOTEL
										AND CLI.ID_CLIENTE = RES.ID_CLIENTE
										AND CLI.NOMBRE = 'Juan Murray'
				);
				
			   COMMIT;




-- 7. Lista el nombre del cliente y nombre del hotel de cada reserva (usa subconsultas

		-- CON JOINS.
		SELECT C.NOMBRE  AS NOMBRE_CLIENTE,
			   H.NOMBRE AS NOMBRE_HOTEL
		FROM RESERVA R INNER JOIN PRODUCTO P 
							   ON R.ID_PRODUCTO = P.ID_PRODUCTO
					   INNER JOIN HOTEL H
							   ON P.ID_HOTEL = H.ID_HOTEL
					   INNER JOIN CLIENTE C
							   ON R.ID_CLIENTE = C.ID_CLIENTE;

		-- TRADICIONAL.
		SELECT C.NOMBRE  AS NOMBRE_CLIENTE,
			   H.NOMBRE AS NOMBRE_HOTEL
		FROM RESERVA R ,PRODUCTO P, HOTEL H, CLIENTE C
		WHERE R.ID_PRODUCTO = P.ID_PRODUCTO
			  AND P.ID_HOTEL = H.ID_HOTEL
			  AND R.ID_CLIENTE = C.ID_CLIENTE;
			  
		-- CON SUBCONSULTAS.
		SELECT ( SELECT CLI.NOMBRE
				 FROM CLIENTE CLI 
				 WHERE CLI.ID_CLIENTE = RE.ID_CLIENTE
				) NOMBRE_CLIENTE,
				
				(SELECT HOTT.NOMBRE
				FROM HOTEL HOTT
				WHERE HOTT.ID_HOTEL =  PROD.ID_HOTEL
				) NOMBRE_HOTEL
		FROM RESERVA RE, PRODUCTO PROD
		WHERE RE.ID_PRODUCTO = PROD.ID_PRODUCTO


-- 8. Devuelve el TIPO_TRANSPORTE y NOMBRE de los Tipos de Transporte ordenados por Nombre en orden ascendente.

		SELECT TIPO_TRANSPORTE, 
			   NOMBRE
		FROM TIPO_TRANSPORTE 
		ORDER BY NOMBRE ASC;

-- 9. Devuelve por cada transporte registrado en la base de datos, la siguiente información: ORIGEN, DESTINO, así como el NOMBRE y DESCRIPCIÓN del tipo de transporte 
-- asociado. Debes hacer esta consulta de las siguientes maneras:

		-- a. Usando SUBCONSULTAS para devolver el NOMBRE y DESCRIPCION del tipo de transporte.
		SELECT TRAN.ORIGEN,
				TRAN.DESTINO,
				(SELECT TT.NOMBRE
					FROM TIPO_TRANSPORTE TT
					WHERE TT.TIPO_TRANSPORTE = TRAN.TIPO_TRANSPORTE
				)NOMBRE_TT,
				
				(SELECT TT.DESCRIPCION
					FROM TIPO_TRANSPORTE TT
					WHERE TT.TIPO_TRANSPORTE = TRAN.TIPO_TRANSPORTE
				)DESCRIPCION_TT
				
		FROM TRANSPORTE TRAN;
		

		-- b. Usando INNER JOIN
		SELECT T.ORIGEN, 
			   T.DESTINO, 
			   TT.NOMBRE, 
			   TT.DESCRIPCION
		FROM TRANSPORTE T INNER JOIN TIPO_TRANSPORTE TT 
								  ON T.TIPO_TRANSPORTE = TT.TIPO_TRANSPORTE;
			
		-- c. Usando la notación tradicional para los cruces entre tablas (WHERE)
		SELECT T.ORIGEN, 
			   T.DESTINO, 
			   TT.NOMBRE, 
			   TT.DESCRIPCION
		FROM TRANSPORTE T, TIPO_TRANSPORTE TT 
		WHERE T.TIPO_TRANSPORTE = TT.TIPO_TRANSPORTE;

-- 10. Devuelve los hoteles registrados en la base de datos ordenador por categoría de menor a mayor, y por el nombre del hotel en orden ascendente.

		SELECT *
		FROM HOTEL 
		ORDER BY CATEGORIA ASC, NOMBRE ASC;


-- 11. Devuelve la información de las agencias registradas en base de datos que no funcionen en modo online.

		SELECT * 
		FROM AGENCIA 
		WHERE IS_ONLINE = 0;

-- 12. Devolver las reservas realizadas por las agencias que funcionan en modo online que reservaran hotel, en concreto se pide que se devuelva el identificador y fecha de reserva, el nombre del cliente, 
-- el nombre, categoría y ciudad del hotel. Usa alias cuando sea necesario. Debes hacer esta consulta de las siguientes maneras:

		-- a. Usando INNER JOIN
		SELECT R.ID_RESERVA, 
			   R.FECHA_RESERVA, 
			   C.NOMBRE AS NOMBRE_CLIENTE, 
			   H.NOMBRE AS NOMBRE_HOTEL, 
			   H.CATEGORIA, 
			   H.CIUDAD 
		FROM RESERVA R INNER JOIN CLIENTE C 
							   ON R.ID_CLIENTE = C.ID_CLIENTE
					   INNER JOIN PRODUCTO P 
							   ON R.ID_PRODUCTO = P.ID_PRODUCTO 
					   INNER JOIN AGENCIA A 
							   ON P.ID_AGENCIA = A.ID_AGENCIA 
					   INNER JOIN HOTEL H 
							   ON P.ID_HOTEL = H.ID_HOTEL
		WHERE A.IS_ONLINE=1;

		-- b. Usando la notación tradicional para los cruces entre tablas

		SELECT R.ID_RESERVA, 
			   R.FECHA_RESERVA, 
			   C.NOMBRE AS CLIENTE, 
			   H.NOMBRE AS HOTEL, 
			   H.CATEGORIA, 
			   H.CIUDAD 
		FROM RESERVA R, PRODUCTO P, AGENCIA A, HOTEL H, CLIENTE C 
		WHERE R.ID_PRODUCTO = P.ID_PRODUCTO 
			  AND P.ID_AGENCIA = A.ID_AGENCIA 
			  AND P.ID_HOTEL = H.ID_HOTEL 
			  AND R.ID_CLIENTE = C.ID_CLIENTE 
			  AND A.IS_ONLINE=1;
	  
-- 13. Devuelve el número de reservas por cliente

		SELECT ID_CLIENTE, COUNT(*) AS NUM_RESERVAS
		FROM RESERVA
		GROUP BY ID_CLIENTE;

/* 14. Devuelve el importe total de las reservas por agencia de viaje */

		SELECT P.ID_AGENCIA, SUM(R.IMPORTE_RESERVA) AS IMPORTE_TOTAL
		FROM RESERVA R INNER JOIN PRODUCTO P 
							   ON R.ID_PRODUCTO = P.ID_PRODUCTO
		GROUP BY P.ID_AGENCIA;

/* 15. Devolver el identificador, fecha de la reserva, número de días reservados y la fecha final de la reserva teniendo en cuenta la fecha de la reserva y el número de días reservados, ordena la 
		información por la fecha final de la reserva en orden descendente. */

		SELECT R.ID_RESERVA, 
			   R.FECHA_RESERVA, 
			   R.NUM_DIAS,
			  (R.FECHA_RESERVA +  R.NUM_DIAS) AS FECHA_FIN
		FROM RESERVA R
		ORDER BY FECHA_FIN DESC;
		
/* 16. Devolver las reservas de transporte realizadas, tanto por las agencias que funcionan en modo online como las que no. Haz una consulta para las reservas realizadas por las agencias online y otra para las que no son online y utiliza el UNION para devolver la información de forma conjunta. La información que debes devolver es, el identificador de la reserva, el origen, destino y el nombre del tipo de transporte utilizado. Debes hacer esta consulta de las siguientes maneras:
		a. Usando INNER JOIN
		b. Usando la notación tradicional para los cruces entre tablas */
		
		
		SELECT RE.ID_RESERVA,
				T.ORIGEN,
				T.DESTINO,
				TT.NOMBRE
		FROM RESERVA RE, TRANSPORTE T, TIPO_TRANSPORTE TT, PRODUCTO PRO, AGENCIA AG 
		WHERE RE.ID_PRODUCTO = PRO.ID_PRODUCTO
				AND PRO.ID_AGENCIA = AG.ID_AGENCIA
				AND PRO.ID_TRANSPORTE = T.ID_TRANSPORTE
				AND T.TIPO_TRANSPORTE = TT.TIPO_TRANSPORTE
				AND AG.IS_ONLINE = 1
		
		UNION
				
		SELECT RE.ID_RESERVA,
				T.ORIGEN,
				T.DESTINO,
				TT.NOMBRE
		FROM RESERVA RE, TRANSPORTE T, TIPO_TRANSPORTE TT, PRODUCTO PRO, AGENCIA AG 
		WHERE RE.ID_PRODUCTO = PRO.ID_PRODUCTO
				AND PRO.ID_AGENCIA = AG.ID_AGENCIA
				AND PRO.ID_TRANSPORTE = T.ID_TRANSPORTE
				AND T.TIPO_TRANSPORTE = TT.TIPO_TRANSPORTE
				AND AG.IS_ONLINE = 0
		

/* 19. Lista el identificador y nombre de todos los clientes registrados en la base de datos. En el caso que esos clientes realizaran reservas, 
		 lista el nombre del hotel reservado, el cual podrá verse si reservó hotel, así como el origen, destino y nombre del tipo de transporte que 
		 tendrá valor si reservó transporte. Devuelve la información ordenada de forma ascendente por el nombre del cliente. */

		SELECT C.ID_CLIENTE, 
			   C.NOMBRE AS CLIENTE, 
			   H.NOMBRE AS HOTEL, 
			   T.ORIGEN, 
			   T.DESTINO, 
			   TT.NOMBRE AS TRANSPORTE
		FROM CLIENTE C LEFT JOIN RESERVA R 
							  ON R.ID_CLIENTE = C.ID_CLIENTE
					   LEFT JOIN PRODUCTO P 
							  ON R.ID_PRODUCTO = P.ID_PRODUCTO 
					   LEFT JOIN HOTEL H 
							  ON P.ID_HOTEL = H.ID_HOTEL
					   LEFT JOIN TRANSPORTE T 
							  ON P.ID_TRANSPORTE = T.ID_TRANSPORTE 
					   LEFT JOIN TIPO_TRANSPORTE TT 
							  ON T.TIPO_TRANSPORTE = TT.TIPO_TRANSPORTE
		ORDER BY C.NOMBRE ASC;



/* 20. Elimina el tipo de transporte que no tenga ningún transporte asociado.  */

		DELETE FROM TIPO_TRANSPORTE
		WHERE TIPO_TRANSPORTE NOT IN (SELECT TIPO_TRANSPORTE
										FROM TRANSPORTE);

