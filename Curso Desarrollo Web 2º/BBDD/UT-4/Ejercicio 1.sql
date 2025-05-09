DROP DATABASE IF EXISTS AGENCIA;
CREATE DATABASE AGENCIA;
USE AGENCIA;

-- Ejercicio 1:
CREATE TABLE CLIENTE (
	ID_CLIENTE INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del cliente',
    NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre del cliente',
    CIUDAD VARCHAR(100) NOT NULL COMMENT 'Ciudad de residencia del cliente',
    CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
) COMMENT 'Datos de los clientes';

CREATE TABLE AGENTE (
	ID_DNI VARCHAR(9) NOT NULL COMMENT 'DNI del agente',
    EMAIL VARCHAR(100) NULL COMMENT 'Correo del agente',
    TELEFONO VARCHAR(15) NOT NULL COMMENT 'Telefono del agente',
    NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre del agente',
    APELLIDOS VARCHAR(150) NOT NULL COMMENT 'Apellidos del agente',
    SALARIO_BASE DECIMAL(10,2) NOT NULL COMMENT 'Salario base del agente',
    OBSERVACIONES VARCHAR(300) NULL COMMENT 'Observaciones sobre el agente',
    CONSTRAINT PK_AGENTE PRIMARY KEY (ID_DNI)
);

CREATE TABLE HOTEL (
	ID_HOTEL INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del hotel',
    NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre del hotel',
    CATEGORIA INT(11) NOT NULL COMMENT 'Categoria del hotel',
    CIUDAD VARCHAR(100) NOT NULL COMMENT 'Ciudad de ubicacion del hotel',
    CONSTRAINT PK_HOTEL PRIMARY KEY (ID_HOTEL)
);

CREATE TABLE AGENCIA (
	ID_AGENCIA INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de agencia',
    NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre de la agencia',
    CIUDAD VARCHAR(100) NOT NULL COMMENT 'Ciudad de ubicacion de la agencia',
    IS_ONLINE INT(1) NOT NULL COMMENT 'Si la agencia es online o no',
    CONSTRAINT PK_AGENCIA PRIMARY KEY (ID_AGENCIA)
);

CREATE TABLE PRODUCTO (
	ID_PRODUCTO INT(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del producto',
    ID_HOTEL INT(11) NULL COMMENT 'Foreing key de la tabla hotel',
    ID_AGENCIA INT(11) NOT NULL COMMENT 'Foreign key de la tabla agencia',
    CONSTRAINT PK_PRODUCTO PRIMARY KEY (ID_PRODUCTO),
    CONSTRAINT FK_PRODUCTO_HOTEL FOREIGN KEY (ID_HOTEL) REFERENCES HOTEL (ID_HOTEL),
    CONSTRAINT FK_PRODUCTO_AGENCIA FOREIGN KEY (ID_AGENCIA) REFERENCES AGENCIA (ID_AGENCIA)
);

CREATE TABLE RESERVA (
	ID_RESERVA INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de reserva',
    FECHA_RESERVA DATETIME NOT NULL COMMENT 'Fecha de la reserva',
    NUM_DIAS INT(11) NOT NULL COMMENT 'Numero de dias reservado',
    IMPORTE_RESERVA DECIMAL(8,2) NOT NULL COMMENT 'Importe sobre la reserva',
    ID_CLIENTE INT(11) NOT NULL COMMENT 'Foreign key de la tabla cliente',
    ID_PRODUCTO INT(11) NOT NULL COMMENT 'Foreign key de la tabla Producto',
    DNI_AGENTE VARCHAR(9) NULL COMMENT 'Foreign key de la tabla Agente',
    CONSTRAINT PK_RESERVA PRIMARY KEY (ID_RESERVA),
    CONSTRAINT FK_RESERVA_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE),
    CONSTRAINT FK_RESERVA_PRODUCTO FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO),
    CONSTRAINT FK_RESERVA_AGENTE FOREIGN KEY (DNI_AGENTE) REFERENCES AGENTE (ID_DNI)
); 


-- Ejercicio 2:
INSERT INTO  AGENCIA (NOMBRE, CIUDAD, IS_ONLINE)
	VALUES ('Atrapalo', 'Madrid', 1),
		   ('Destinia', 'Madrid', 1),
		   ('Rumbo', 'Barcelona', 1),
		   ('Catai','Madrid', 0),
           ('Horizonte', 'Paralelo ToledoID_AGENCIAID_AGENCIA', 0);
select * from agencia;


INSERT INTO AGENTE (ID_DNI, EMAIL, TELEFONO, NOMBRE, APELLIDOS, SALARIO_BASE, OBSERVACIONES)
	VALUES ('41275026c', 'agente@catai.es', 901789521, 'Leonor', 'Aranguez', 2100.0, 'Agente de ventas'),
		   ('06847101D', 'agente@horizonte.es', 900112233, 'Laura', 'Cruz', 1400.0, 'Agente de ventas');
select * from agente;


INSERT INTO CLIENTE (NOMBRE, CIUDAD)
	VALUES ('Juan Murray', 'Madrid'),
			('Rosario Lopez', 'Madrid'),
			('Pedro Lopez', 'Toledo'),
			('Amelia Sanchez', 'Cuenca');
select * from cliente;


INSERT INTO HOTEL (NOMBRE, CATEGORIA, CIUDAD)
	VALUES ('Fiesta INN', 4, 'Madrid'),
			('Camino Real', 5, 'Toledo'),
			('Mirador', 3, 'Alicante');
select * from hotel;


INSERT INTO PRODUCTO (ID_HOTEL, ID_AGENCIA)
	VALUES ( 1, 1),
			( 1, 2),
			( 1, 3),
			( 1, 4),
			( 1, 5),
			( 2, 1),
			( 2, 2),
			( 2, 3),
			( 2, 4),
			( 2, 5),
			( 3, 1),
			( 3, 2),
			( 3, 3),
			( 3, 4),
			( 3, 5);
select * from producto;


INSERT INTO RESERVA (FECHA_RESERVA, NUM_DIAS, IMPORTE_RESERVA, ID_CLIENTE, ID_PRODUCTO, DNI_AGENTE)
	VALUES ('01/05/20', 2, 150, 1, 1, NULL),
			('01/05/20', 2, 210, 2, 2, NULL),
            ('10/06/20', 7, 600, 3, 6, NULL),
            ('15/07,20', 7, 1200, 3, 4, '41275026C');
select * from reserva;

CREATE TABLE TIPO_TRANSPORTE (
	TIPO_TRANSPORTE VARCHAR(10) NOT NULL COMMENT 'Clave primaria de la tabla tipo_transporte',
    NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre del tipo transporte',
	DESCRIPCION VARCHAR(100) NULL COMMENT 'Descripcion del tipo transporte',
    CONSTRAINT PK_TIPO_TRANSPORTE PRIMARY KEY (TIPO_TRANSPORTE)
);

CREATE TABLE TRANSPORTE (
	ID_TRANSPORTE INT AUTO_INCREMENT NOT NULL COMMENT 'Clave primaria de la tabla transporte',
	ORIGEN VARCHAR(50) NOT NULL COMMENT 'Origen del transporte',
    DESTINO VARCHAR(50) NOT NULL COMMENT 'Destino del transporte',
    TIPO_TRANSPORTE VARCHAR(10) NOT NULL COMMENT 'Tipo del transporte',
    CONSTRAINT PK_ID_TRANSPORTE PRIMARY KEY (ID_TRANSPORTE),
    CONSTRAINT FK_TIPO_TRANSPORTE_TRANSPORTE FOREIGN KEY (TIPO_TRANSPORTE) REFERENCES TIPO_TRANSPORTE (TIPO_TRANSPORTE)
);


ALTER TABLE PRODUCTO
	ADD COLUMN ID_TRANSPORTE INT NULL COMMENT 'ID del transporte del producto',
	ADD CONSTRAINT FK_PRODUCTO_TRANSPORTE FOREIGN KEY (ID_TRANSPORTE) REFERENCES TRANSPORTE (ID_TRANSPORTE);


ALTER TABLE CLIENTE 
	MODIFY COLUMN NOMBRE VARCHAR(100) NOT NULL;


INSERT INTO TIPO_TRANSPORTE (TIPO_TRANSPORTE, NOMBRE, DESCRIPCION)
	VALUES ('TR0000001', 'Autobus', 'Transporte en autobus'),
			('TR0000002', 'Tren', 'Transporte en tren'),
            ('TR0000003', 'Avion', '');

select * from tipo_transporte;






