-- 1) Muestra el identificador,  nombre y apellidos de los clientes del videoclub junto con el tipo
-- de terifa que tienen, ordenados alfabeticamente por su nombre y apellido.

SELECT CLI.ID_CLIENTE, CLI.NOMBRE, CLI.APELLIDO,TA.ID_TARIFA, TA.TIPO_TARIFA
FROM CLIENTE CLI, TARIFA TA
WHERE CLI.TAFIRA = TA.ID_TARIFA
ORDER BY NOMBRE, APELLIDO ASC;

-- 2) Muestra el nombre y apellidos de los clientes junto con el titulo de las peliculas que han alquilado y el nombre
-- y nacionalidad de los actores que han participado en esas peliculas.

SELECT CLI.NOMBRE AS 'NOMBRE DEL CLIENTE', CLI.APELLIDO AS 'APELLIDO DEL CLIENTE', ALQ.ID_ALQUILER AS 'ID DEL ALQUILER',
	PEL.TITULO AS 'TITULO DE LA PELICULA', ACT.NOMBRE AS 'NOMBRE DEL ACTOR'
FROM CLIENTE CLI, ALQUILER ALQ, ACTOR ACT, PELICULA PEL;

-- 3) Muestra el numero total de peliculas

SELECT TITULO AS 'Titulo de la peliculas', STOCK AS 'Stock de la pelicula'
FROM PELICULA;

-- 4) Muestra todos los campos de los clientes que tienen tarifa VIP o Premium y han nacido en mayo, o tienen tarifa basica y han nacido en agosto.

SELECT CLI.ID_CLIENTE, CLI.NOMBRE, CLI.APELLIDO, CLI.FECHA_NAC, CLI.TELEFONO, CLI.TARIFA
FROM CLIENTE CLI, TARIFA TA
WHERE CLI.TARIFA = TA.ID_TARIFA;

-- 6) Muestra cuantas peliculas ha alquilado cada cliente y su tarifa asignada.

SELECT CLI.NOMBRE AS 'Nombre del cliente', ALQ.ID_ALQUILER AS 'ID del alquiler', TA.TIPO_TARIFA AS 'Tipo de tarifa'
FROM CLIENTE CLI, TARIFA TA, ALQUILER ALQ
WHERE CLI.ID_CLIENTE = ALQ.ID_ALQUILER AND CLI.TAFIRA = TA.ID_TARIFA;

-- 9) Muestra los clientes que no han alquilado ninguna pelicula.
SELECT * FROM ALQUILER;
select * from cliente;

SELECT CLI.ID_CLIENTE AS 'ID DEL CLIENTE', CLI.NOMBRE AS 'NOMBRE DEL CLIENTE', ALQ.ID_ALQUILER AS 'ID DEL ALQUILEL'
FROM CLIENTE CLI, ALQUILER ALQ
WHERE ALQ.ID_CLIENTE = CLI.ID_CLIENTE;

-- 10) Incrementa el stock de todas las peliculas en un 10% si han sido alquiladas mas de 1 vez.

-- 11) Elimina de la base de datos a los clientes que no han realizado ningun alquiler.

-- 12) Muestra las peliculas que han sido alquiladas mas de 3 veces y que tienen un stock mayor a 5 unidades.

-- 13) Muestra el numero total de alquileres realizados por cada proveedor de peliculas y ordena de mayor a menor.

SELECT * FROM CLIENTE;
SELECT * FROM ALQUILER;









