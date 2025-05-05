
-- 1. Devuelve los entrenadores nacidos en los años 80 y no han fallecido

SELECT *
FROM ENTRENADOR
WHERE FECHA_NACIMIENTO LIKE '198%' AND FECHA_FALLECIMIENTO IS NULL;

-- 2. Lista el Nombre, el Nombre del deporte y la Fecha de inicio, de todos aquellos campeonatos que tengan una fecha de fundación registrada

SELECT NOMBRE, NOMBRE_DEPORTE, FECHA_INICIO
FROM CAMPEONATO
WHERE FECHA_FUND IS NOT NULL;


-- 3. Recupera las selecciones de aquellos jugadores con una edad entre 20 y 40 años (Usa INNER JOIN)

SELECT DISTINCT S.*
FROM SELECCION S
INNER JOIN JUGADOR J
	ON S.ID_SELECCION = J.ID_SELECCION
WHERE J.EDAD BETWEEN 20 AND 40;


-- 4 Devuelve el identificador, nombre, apellidos y fecha de nacimiento de los entrenadores, 
-- nombre del equipo y el código del cuerpo técnico, de aquellos entrenadores cuyo cuerpo técnico tenga más de 5 integrantes

SELECT E.ID_ENTRENADOR, E.NOMBRE AS NOMBRE_ENTRENADOR, E.APELLIDOS, E.FECHA_NACIMIENTO, EQ.NOMBRE AS NOMBRE_EQUIPO, CT.NUM_INTEGRANTES
FROM ENTRENADOR E
INNER JOIN EQUIPO EQ 
	ON E.EQUIPO = EQ.CODIGO_EQUIPO
INNER JOIN CUERPO_TECNICO CT 
	ON EQ.CODIGO_EQUIPO = CT.EQUIPO
WHERE CT.NUM_INTEGRANTES > 5;

-- 5 Devuelve el nombre y la categoría de las selecciones, nombre y país de las competiciones que tienen una fecha de fundación, nombre y edad de los jugadores, 
-- ordenados por la edad de los jugadores empezando por los más jóvenes (Usa notación tradicional).

SELECT S.NOMBRE AS NOMBRE_SELECCION , S.CATEGORIA, C.NOMBRE AS NOMBRE_CAMPEONATO, C.PAIS, J.NOMBRE AS NOMBRE_JUGADOR, J.EDAD
FROM SELECCION S, CAMPEONATO_SELECCION CS, CAMPEONATO C, JUGADOR J
WHERE S.ID_SELECCION = CS.ID_SELECCION
	AND CS.ID_CAMPEONATO = C.ID_CAMPEONATO
    AND S.ID_SELECCION = J.ID_SELECCION
    AND C.FECHA_FUND IS NOT NULL
ORDER BY J.EDAD ASC;


-- 6 Por cada uno de los equipos devuelve la media salarial de sus jugadores, el salario máximo, el salario mínimo y el salario total que paga cada equipo.

-- 8 Devuelve la información de los entrenadores cuyo apellido contenga una vocal y la selección de sus jugadores empiece por E

SELECT DISTINCT E.*
FROM ENTRENADOR ENT
INNER JOIN EQUIPO EQ
	ON E.EQUIPO = EQ.CODIGO_EQUIPO
INNER JOIN JUGADOR J 
	ON EQ.CODIGO_EQUIPO = J.CODIGO_EQUIPO
INNER JOIN SELECCION S 
	ON J.ID_SELECCION = S.ID_SELECCION
WHERE (ENT.APELLIDOS LIKE '%a%'
		OR ENT.APELLIDOS LIKE '%e%'
		OR ENT.APELLIDOS LIKE '%i%'
		OR ENT.APELLIDOS LIKE '%o%'
		OR ENT.APELLIDOS LIKE '%u%')
        AND S.NOMBRE LIKE '%E%';

-- 13 Devuelve la información de las selecciones que no participan en ningún campeonato y sus jugadores tienen un salario superior a 850€.

SELECT *
FROM SELECCION S
INNER JOIN JUGADOR J 
	ON S.ID_SELECCION = J.ID_SELECCION
WHERE S.ID_SELECCION NOT IN (SELECT DISTINCT ID_SELECCION FROM CAMPEONATO_SELECCION)
	AND J.SALARIO > 850;


-- 17. Devuelve el nombre y tipo de aquellos entrenadores cuya selección participa en más de 6 campeonatos.

SELECT S.ID_SELECCION, S.NOMBRE
FROM SELECCION S
INNER JOIN CAMPEONATO_SELECCION CS
	ON S.ID_SELECCION = CS.ID_SELECCION
WHERE S.ID_SELECCION IN (SELECT DISTINCT S.ID_SELECCION
							FROM SELECCION S
                            INNER JOIN CAMPEONATO_SELECCION CS
								ON S.ID_SELECCION = CS.ID_SELECCION
							GROUP BY S.ID_SELECCION
                            HAVING COUNT(*) > 6);
    






