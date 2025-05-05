
DROP DATABASE IF EXISTS LIGA;
CREATE DATABASE IF NOT EXISTS LIGA;
USE LIGA;

-- 1) Obtener el nombre de los equipos cuyas ciudades contengan la letra r, ordenadas por nombre en orden alfabético.
SELECT EQ.NOMBRE
FROM EQUIPO EQ
WHERE EQ.CIUDAD LIKE '%r%'
ORDER BY EQ.NOMBRE ASC;

-- 2) Realiza una consulta que nos devuelva el número de jugadores que jueguen en la posición de Pívot (P) y que jueguen en un equipo de la ciudad de Valencia o de Madrid.
	-- a) Usando INNER JOIN
    SELECT EQ.ID_EQUIPO, EQ.NOMBRE,  COUNT(*)
    FROM JUGADOR JU
    INNER JOIN EQUIPO EQ
		ON JU.ID_EQUIPO = EQ.ID_EQUIPO
    WHERE JU.POSICION = 'P'
		AND (EQ.CIUDAD = 'Valencia' OR EQ.CIUDAD = 'Madrid')
    GROUP BY EQ.ID_EQUIPO, EQ.NOMBRE;


	-- b) Usando la notación tradicional para los cruces entre tablas.
	SELECT EQ.ID_EQUIPO, EQ.NOMBRE, COUNT(*) AS NUMERO_JUGADORES
	FROM JUGADOR JU, EQUIPO EQ
	WHERE JU.ID_EQUIPO = EQ.ID_EQUIPO
	AND JU.POSICION = 'P'
	AND (EQ.CIUDAD = 'Valencia' OR EQ.CIUDAD = 'Madrid')
	GROUP BY EQ.ID_EQUIPO, EQ.NOMBRE;

-- 3) Realiza una consulta que nos devuelva los siguientes datos de todos los partidos jugados en 2016 ordenados por fecha de partido ascendente. 
-- Hay que mostrar el nombre de los dos equipos (local y visitante), fecha del juego y nombre y apellidos del árbitro.

	-- a) Usando INNER JOIN
    SELECT EL.NOMBRE AS EQUIPO_LOCAL,
			EV.NOMBRE AS EQUIPO_VISITANTE,
			J.FECHA_JUEGO,
			A.NOMBRE AS NOMBRE_ARBITRO,
			A.APELLIDOS AS APELLIDO_ARBITRO
	FROM JUEGO J
	INNER JOIN EQUIPO EL
		ON J.ID_EQUIPO_LOCAL = EL.ID_EQUIPO
	INNER JOIN EQUIPO EV
		ON J.ID_EQUIPO_FUERA = EV.ID_EQUIPO
	INNER JOIN ARBITRO A
		ON J.ID_ARBITRO = A.ID_ARBITRO
	WHERE YEAR(J.FECHA_JUEGO) = 2016
	ORDER BY J.FECHA_JUEGO ASC;

	-- b) Usando la notación tradicional para los cruces entre tablas
	
-- 8) Realiza una consulta que nos muestre el nombre, la ciudad y los puntos obtenidos, por los equipos que hayan ganado al menos dos partidos jugando como local

SELECT E.NOMBRE, E.CIUDAD, E.PUNTOS
FROM EQUIPO E
WHERE E.ID_EQUIPO IN (
	SELECT E.ID_EQUIPO
	FROM EQUIPO E
	INNER JOIN JUEGO J
		ON E.ID_EQUIPO = J.ID_EQUIPO_LOCAL
	WHERE J.PUNTOS_EQUIPO_LOCAL > J.PUNTOS_EQUIPO_FUERA
	GROUP BY E.ID_EQUIPO, E.NOMBRE
	HAVING COUNT(*) > 2
    );

-- 9) Realiza una consulta que nos devuelva todos los datos de los equipos que no tengan registrado ningún jugador en la posición de Alero (A).

SELECT DISTINCT e.*
FROM Equipo e
LEFT JOIN Jugador j
  ON e.id_equipo = j.id_equipo AND j.posicion = 'A'
WHERE j.id_jugador IS NULL;


-- 10) Realiza una consulta que nos muestre el nombre, apellidos, posición, altura, peso, salario y fecha de nacimiento de los jugadores que midan entre 1.80 y
-- 2.20 metros y pesen menos de 115 kg.






