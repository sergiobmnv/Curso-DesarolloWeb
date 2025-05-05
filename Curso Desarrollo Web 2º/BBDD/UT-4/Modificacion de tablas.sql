
1. /*Agregar una nueva columna a una tabla.*/

	ALTER TABLE nombre_de_la_tabla
	ADD nueva_columna tipo_de_dato;
	

2. /*Modificar una columna existente.*/

	ALTER TABLE nombre_de_la_tabla
	MODIFY COLUMN nombre_columna  nuevo_tipo_de_dato;
	

3. /*Eliminar una columna de una tabla.*/

	ALTER TABLE nombre_de_la_tabla
	DROP COLUMN nombre_columna;
	

4. /*Agregar una nueva tabla.*/

		CREATE TABLE nueva_tabla (
		id INT PRIMARY KEY,
		nombre VARCHAR(100),
		fecha DATE
		);


5. /*Eliminar una tabla.*/

	DROP TABLE nombre_de_la_tabla;
	
	
6. /*Insertar datos a una tabla.*/

	INSERT INTO clientes (id, nombre, email, fecha_registro)
	VALUES (1, 'Juan Pérez', 'juan.perez@example.com', '2023-10-01');
	
7. /*Explicacion del Group By*/

	SELECT AG.DNI, AG.NOMBRE, COUNT(*) AS MOVIMIENTOS /*La funcion Count cuenta*/
	FROM AGENTE AS AG, MOVIMIENTO AS M
	WHERE AG.DNI = M.AGENTE_DNI
	GROUP BY AG.DNI, AG.NOMBRE;
	
	
8. Eliminar un equipo de una tablA (PRIMERO HAY QUE ELIMINAR A LOS QUE DEPENDEN DE ESA TABLA, EN ESTE CASO EL JUGADOR Y EL ENTRENADO).
	
	DELETE FROM EQUIPO WHERE NOMBRE = 'Real Madrid';