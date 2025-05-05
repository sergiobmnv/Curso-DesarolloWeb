

/* 1) Obtener el nombre de los equipos cuyas ciudades contengan la letra r, 
        ordenadas por nombre en orden alfabético */

		SELECT EQ.NOMBRE
		FROM EQUIPO EQ
		WHERE EQ.CIUDAD LIKE '%r%'
		ORDER BY EQ.NOMBRE ASC;


/* 2) Realiza una consulta que nos devuelva el número de jugadores que jueguen en la posición de Pívot (P) y 
        que jueguen en un equipo de la ciudad de Valencia o de Madrid. */
		
		-- a) Usando INNER JOIN
		
		
		
		
		-- b) Usando la notación tradicional para los cruces entre tablas

		SELECT COUNT(1)
		FROM JUGADOR JUG, EQUIPO EQ
		WHERE JUG.ID_EQUIPO = EQ.ID_EQUIPO
				AND JUG.POSICION = 'P'
				AND EQ.CIUDAD IN ('Valencia', 'Madrid');


/* 3) Realiza una consulta que nos devuelva los siguientes datos de todos los partidos jugados en 2016 ordenados por fecha de partido ascendente. 
        Hay que mostrar el nombre de los dos equipos (local y visitante), fecha del juego y nombre y apellidos del árbitro. */
		
		
		-- a) Usando SUBCONSULTAS para devolver el NOMBRE de los equipos, así como el NOMBRE y APELLIDOS del árbitro.
		
		SELECT (SELECT EQUI.NOMBRE
					FROM EQUIPO EQUI
					WHERE EQUI.ID_EQUIPO = JUG.ID_EQUIPO_LOCAL
				) NOMBRE_EQUIPO_LOCAL,
					JUG.FECHA_JUEGO,
				
				(SELECT ARB.NOMBRE
					FROM ARBITRO ARB
					WHERE ARB.ID_ARBITRO = 
				) NOMBRE_EQUIPO_VISITANTE,
		
		FROM JUEGO JUG
		WHERE TO_NUMBER (TO_CHAR(JUG.FECHA_JUEGO, 'YYYY')) = 2016
		ORDER BY JUG.FECHA_JUEGO ASC;
		
		

		-- b) Usando INNER JOIN.

		SELECT JUE.FECHA_JUEGO,
				ARB.NOMBRE,
				ARB.APELLIDOS,
				EL.NOMBRE AS "NOMBRE EQUIPO LOCAL",
				EV.NOMBRE AS "NOMBRE EQUIPO VISITANTE"
		FROM JUEGO JUE, ARBITRO ARB, EQUIPO EL, EQUIPO EV
		WHERE TO_CHAR (JUE.FECHA_JUEGO, 'YYYY' ) = '2016'
				AND JUE.ID_ARBITRO = ARB.ID_ARBITRO
				AND JUE.ID_EQUIPO_LOCAL = EL.ID_EQUIPO
				AND JUE.ID_EQUIPO_FUERA = EV.ID_EQUIPO
		ORDER BY JUE.FECHA_JUEGO;
		
		
/* 4) Realiza una consulta que nos devuelva el nombre y apellidos de todos los jugadores excepto el mejor y el peor pagados. */
		
		SELECT JUG.NOMBRE,
				JUG.APELLIDOS
		FROM JUGADOR JUG
		WHERE SALARIO > (SELECT MIN(SALARIO) FROM JUGADORES)
						AND < (SELECT MAX(SALARIO) FROM JUGADOR); 

				

/* 5) Realiza una consulta que nos devuelva el nombre y la ciudad de todos los equipos que tengan un jugador cuyo apellido termine en s. 
        Devolver los datos ordenados en forma ascendente. */
		
		-- a) Usando INNER JOIN.
		
		
		-- b) Usando la notación tradicional para los cruces entre tablas.

		SELECT DISTINCT EQ.NOMBRE, EQ.CIUDAD
		FROM EQUIPO EQ, JUGADOR JUG
		WHERE EQ.ID_EQUIPO = JUG.ID_EQUIPO
			AND JUG.APELLIDOS LIKE '%s'
		ORDER BY EQ.NOMBRE ASC, EQ.CIUDAD;


/* 6) Realiza una consulta que devuelva el nombre, apellidos y salario de los jugadores que jueguen en la posición de pívots (P) , 
así como el nombre de su equipo, de los jugadores que ganan más de 35.000 Euros ordenando los resultados del mejor al peor pagado. */


		-- a) Usando INNER JOIN.
		
		
		-- b) Usando la notación tradicional para los cruces entre tablas.

		SELECT JUG.NOMBRE, JUG.APELLIDOS, JUG.SALARIO, EQ.NOMBRE
		FROM JUGADOR JUG, EQUIPO EQ
		WHERE JUG.ID_EQUIPO = EQ.ID_EQUIPO
				AND POSICION = 'P'
				AND JUG.SALARIO > 35000
		ORDER BY JUG.SALARIO DESC;

					--Uso de JOIN.
		SELECT JUG.NOMBRE, JUG.APELLIDOS, JUG.SALARIO, EQ.NOMBRE
		FROM JUGADOR JUG JOIN EQUIPO EQ
					ON JUG.ID_EQUIPO  = EQ.ID_EQUIPO
		WHERE JUG.POSICION = 'P'
				AND JUG.SALARIO > 35000
		ORDER BY JUG.SALARIO DESC;



/* 7) Realiza una consulta que nos devuelva el salario medio de cada equipo, pero solo de aquellos cuya media sea superior a 85.000 Euros. */

		SELECT ID_EQUIPO, AVG(SALARIO) 
		FROM JUGADOR 
		GROUP BY ID_EQUIPO 
		HAVING AVG(SALARIO) > 85000;



/* 8) Realiza una consulta que nos muestre el nombre, la ciudad y los puntos obtenidos, por los equipos que hayan ganado al menos dos partidos jugando como local. */

			SELECT EQUI.NOMBRE,
				EQUI.CIUDAD,
				EQUI.PUNTOS
				
			FROM EQUIPO EQUI, JUEGO JUE

			WHERE EQUI.ID_EQUIPO = JUE.ID_EQUIPO_LOCAL
					AND JUE.PUNTOS_EQUIPO_LOCAL > JUE.PUNTOS_EQUIPO_FUERA
					
			GROUP BY EQUI.NOMBRE,
					EQUI.CIUDAD,
					EQUI.PUNTOS
			HAVING COUNT(*) >= 2
			

/* 9) Realiza una consulta que nos devuelva todos los datos de los equipos que no tengan registrado ningún jugador en la posición de Alero (A).*/

			




/* 10) Realiza una consulta que nos muestre el nombre, apellidos, posición, altura, peso, salario y 
    fecha de nacimiento de los jugadores que midan entre 1.80 y
    2.20 metros y pesen menos de 115 kg.  */


			SELECT JUG.NOMBRE, JUG.APELLIDOS, JUG.POSICION, JUG.PESO, JUG.SALARIO, JUG.FECHA_NACIMIENTO
			FROM JUGADOR JUG
			WHERE JUG.ALTURA BETWEEN 1.80 AND 2.20
					AND JUG.PESO < 115;



/* 11) Realiza una consulta a través de la cual se puedan consultar los siguientes datos relativos a un partido: Nombre del equipo local, 
       Nombre del equipo visitante, puntos encajados en ese partido por el equipo local, así como los puntos totales que lleva el equipo local, 
       puntos encajados por ese partido del equipo visitante, así como los puntos totales que lleva ese el equipo visitante, fecha en la que se celebró el partico, 
       así como nombre y apellido del árbitro del partido (usa INNER JOIN y alias cuando sea preciso).  */

			SELECT EL.NOMBRE AS "EQUIPO LOCAL", 
					EV.NOMBRE AS "EQUIPO VISITANTE",
					JUG.PUNTOS_EQUIPO_FUERA AS "ENCAJOS POR EL EQUIPO LOCAL",
					EL.PUNTOS AS "TOTAL PUNTOS EQUIPO LOCAL",
					JUG.PUNTOS_EQUIPO_LOCAL AS "ENCANJADOS POR EQUIPO",
					EV.PUNTOS AS "TOTAL PUNTOS EQUIPO VISITANTE",
					JUG.FECHA_JUEGO,
					ARB.NOMBRE,
					ARB.APELLIDOS
			FROM  JUEGO JUG, EQUIPO EL, EQUIPO EV, ARBITRO ARB
			WHERE JUG.ID_EQUIPO_LOCAL = EL.ID_EQUIPO
					AND JUG.ID_EQUIPO_FUERA = EV.ID_EQUIPO
					AND JUG.ID_ARBITRO = ARB.ID_ARBITRO;
					
/* 12) Suba el salario de los jugadores que pertenecen al equipo de Unicaja en 800 euros. */

		UPDATE JUGADOR
		SET SALARIO = SALARIO + 800
		WHERE ID_EQUIPO IN (SELECT E.ID_EQUIPO
					FROM EQUIPO E,
					WHERE E.NOMBRE = 'Unicaja');
					
					COMMIT;


/* 13) Eliminar todos los equipos que no hayan jugado partidos como locales. */

		DELETE FROM EQUIPO 
		WHERE ID_EQUIPO NOT IN (SELECT J.ID_EQUIPO_LOCAL
							 FROM JUEGO J );
							 
							 COMMIT;
		


/* 14) Actualizar el valor de puesto para el jugador con nombre Shane y apellido Lawal cambiándolo a Escolta (E).  */

			UPDATE JUGADOR
			SET POSICION = 'E'
			WHERE NOMBRE = 'Shane'  
					AND APELLIDOS = 'Lawal';

			COMMIT;