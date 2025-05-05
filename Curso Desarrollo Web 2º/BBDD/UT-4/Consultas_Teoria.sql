

SELECT A.* //Coge todas las columnas de la tabla asignatura
-- Relacionar la tabla asignatura con la tabla curso.

	SELECT A.NOMBRE AS NOMBRE_ASIGNATURA, C.NOMBRE AS NOMBRE_CURSO  //Alias para las tablas 
	FROM ASIGNATURA AS A, CURSO AS C  								//Alias para las columnas
	WHERE A.ID_CURSO = C.ID_CURSO;
	
	
-- Relacionar la tabla empleado con la tabla tipo_empleado buscando el nombre del tipo empleado y no el id.

	SELECT E.NOMBRE AS NOMBRE_EMPLEADO, E.APELLIDO AS APELLIDO_EMPLEADO, TE.TIPO_EMPLEADO
	FROM EMPLEADO AS E, TIPO_EMPLEADO AS TE
	WHERE E.ID_TIPO_EMPLEADO = TE.ID_TIPO_EMPLEADO AND TE.NOMBRE_TIPO = 'Profesor'; //Ese AND busca solo el tipo de profesor que en este caso seria "Profesor"


-- Relacionar la tabla de asignatura con la de empleado, teniendo en cuenta que entre medias hay otra tabla (imparte).

	SELECT E.NOMBRE AS NOMBRE_EMPLEADO, A.NOMBRE AS NOMBRE_ASIGNATURA
	FROM EMPLEADO AS E, IMPARTE AS I, ASIGNATURA AS A 
	WHERE E.ID_EMPLEADO = I.ID_EMPLEADO AND I.ID_ASIGNATURA = A.ID_ASIGNATURA;