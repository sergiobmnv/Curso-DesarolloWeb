 CREATE DATABASE VideoClub_SergioBravo;
 USE VideoClub_SergioBravo;
 
 
 -- Ejercicio 1)
 
 CREATE TABLE CLIENTE (
	ID_CLIENTE INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de cliente',
    NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre del cliente',
    APELLIDO VARCHAR(50) NOT NULL COMMENT 'Apellido del cliente',
    FECHA_NAC DATE NOT NULL COMMENT 'Fecha de nacimiento del cliente',
    TELEFONO VARCHAR(15) NULL COMMENT 'Telefono del cliente',
    CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
 );
 
 CREATE TABLE PELICULA (
	ID_PELICULA INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la pelicula',
    TITULO VARCHAR(100) NOT NULL COMMENT 'Titulo de la pelicula',
    STOCK INT(11) NOT NULL COMMENT 'Stock de las peliculas',
    CONSTRAINT PK_PELICULA PRIMARY KEY (ID_PELICULA)
);

CREATE TABLE ALQUILER (
	ID_ALQUILER INT(11) NOT NULL COMMENT 'Identificador del alquiler',
    CANTIDAD INT(11) NOT NULL COMMENT 'Cantidad del alquiler',
    ID_PELICULA INT(11) NOT NULL,
    ID_CLIENTE INT(11) NOT NULL,
    CONSTRAINT PK_ALQUILER PRIMARY KEY (ID_ALQUILER),
    CONSTRAINT FK_ALQUILER_PELICULA FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA),
    CONSTRAINT FK_ALQUILER_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
);

CREATE TABLE ACTOR (
	ID_ACTOR INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del actor',
    NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre del actor',
    NACIONALIDAD VARCHAR(50) NULL COMMENT 'Nacionalidad del actor',
    CONSTRAINT PK_ACTOR PRIMARY KEY (ID_ACTOR)
);

CREATE TABLE PELICULA_ACTOR (
	ID_PELICULA INT(11) NOT NULL,
    ID_ACTOR INT(11) NOT NULL,
    CONSTRAINT FK_PELICULA_ACTOR_PELICULA FOREIGN KEY (ID_PELICULA) REFERENCES PELICULA (ID_PELICULA),
    CONSTRAINT FK_PELICULA_ACTOR_ACTOR FOREIGN KEY (ID_ACTOR) REFERENCES ACTOR (ID_ACTOR)
);


-- Ejercicio 2)

INSERT INTO PELICULA (TITULO, STOCK)
	VALUES ('El padrino', 5),
			('Titanic', 3),
            ('Matrix', 10),
            ('Jurasicc Park', 4),
            ('Interstellar', 6);

INSERT INTO ACTOR (NOMBRE, NACIONALIDAD)
	VALUES ('Marlon Brandon', 'EE.UU'),
			('Al Pacino', 'EE.UU'),
            ('Leonardo Di Caprio', 'EE.UU'),
            ('Kate Winslet', 'Reino Unido'),
            ('Keanu Reeves', 'Canada'),
            ('Laurence Fishburne', 'EE.UU'),
            ('Sam Neill', 'Nueva Zelanda'),
            ('Laura Dern', 'EE.UU'),
            ('Al Pacino', 'EE.UU'),
            ('Matthew McConaughey', 'EE.UU'),
            ('Anne Hathaway', 'EE.UU'),
			('Kate Winslet', 'Reino Unido');

INSERT INTO PELICULA_ACTOR (ID_PELICULA, ID_ACTOR)
	VALUES (1, 1),
			(1, 2),
            (2, 3),
            (2, 4),
            (3,5),
            (3,6),
            (4,7),
            (4,8),
            (4,9),
            (5,10),
            (5,11),
			(5,12);

-- Ejercicio 3)

INSERT INTO CLIENTE (NOMBRE, APELLIDO, FECHA_NAC, TELEFONO)
	VALUES ('Juan', 'Pérez', '1990-03-12', '600123456'),
			('Laura', 'García', '1985-07-25', '611234567'),
            ('Manuel', 'López', '1998-10-09', '622345678'),
            ('Pedro', 'Ruiz', '1995-04-27', '644567890'),
			('Ana', 'Martínez', '1995-05-15', '622345111');


INSERT INTO ALQUILER (ID_ALQUILER, CANTIDAD, ID_PELICULA, ID_CLIENTE)
	VALUES (001,2,1,1),
			(002,1,2,2),
            (003,2,3,3),
            (004,1,4,5),
            (005,3,5,4),
            (006,1,1,2),
            (007,2,3,5),
            (008,1,5,1),
            (009,1,2,3),
			(010,2,4,4);

-- Ejercicio 4)

CREATE TABLE BANCO (
	ID_BANCO INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Idetificador del banco',
    NOMBRE VARCHAR(25) NOT NULL COMMENT 'Nombre del banco',
    DIRECCION VARCHAR(25) NOT NULL COMMENT 'Direccion del banco',
    CONSTRAINT PK_BANCO PRIMARY KEY (ID_BANCO)
);

ALTER TABLE ACTOR
	MODIFY COLUMN NACIONALIDAD VARCHAR(50) NOT NULL;

ALTER TABLE CLIENTE
	ADD COLUMN ID_BANCO INT(11) NULL,
    ADD CONSTRAINT FK_BANCO_CLIENTE FOREIGN KEY (ID_BANCO) REFERENCES BANCO (ID_BANCO);

-- Ejercicio 6)
	DROP TABLE PELICULA_ACTOR;
	DROP TABLE ALQUILER;
	DROP TABLE ACTOR;
	DROP TABLE PELICULA;
	DROP TABLE CLIENTE;
    DROP TABLE BANCO;
	


