

/* 5) Realiza  una  consulta  que  devuelva  el  título  y  productora  de  las  películas  cuyo  director 
tenga la nacionalidad USA  */

SELECT PELI.TITULO, PELI.PRODUCTORA
FROM PELICULA PELI, DIRECTOR DIREC
WHERE PELI.DIRECTOR = DIREC.NOMBRE
        AND DIREC.NACIONALIDAD = 'USA'


/* 6) Realiza una consulta que devuelva el nombre, sexo de los actores protagonistas, y título 
de la película en la que actúan.  */

SELECT ACT.NOMBRE, ACT.SEXO, PELI.TITULO
FROM ACTOR ACT, ACTUA AC, PELICULA PELI
WHERE ACT.NOMBRE = AC.ACTOR 
        AND AC.ID_PELI = PELI.ID
        AND AC.PROTA = 'S';

