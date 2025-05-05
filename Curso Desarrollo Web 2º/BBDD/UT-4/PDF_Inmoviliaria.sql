
DROP DATABASE IF EXISTS inmobiliaria;

CREATE DATABASE IF NOT EXISTS inmobiliaria;
USE inmobiliaria;

CREATE TABLE TIPO_INMUEBLE (
  CODIGO_TIPO_INMUEBLE VARCHAR(10) NOT NULL COMMENT 'Tipo de inmueble',
  DESCRIPCION VARCHAR(200) NOT NULL COMMENT 'Descripción del tipo de inmueble',
  CONSTRAINT PK_TIPO_INMUEBLE PRIMARY KEY (CODIGO_TIPO_INMUEBLE)
);

CREATE TABLE INMUEBLE (
  ID_INMUEBLE INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del inmueble',
  DIRECCION VARCHAR(300) NOT NULL COMMENT 'Dirección del inmueble',
  POBLACION VARCHAR(100) NOT NULL COMMENT 'Población del inmueble',
  CODIGO_POSTAL INT NULL COMMENT 'Código Postal del inmueble',
  PRECIO_VENTA DECIMAL(12,2) NULL COMMENT 'Precio de venta inicial del inmueble',
  PRECIO_ALQUILER DECIMAL(12,2) NULL COMMENT 'Precio de alquiler inicial del inmueble',
  FECHA_ULTIMO_MOV DATETIME NULL COMMENT 'Fecha del último movimiento del inmueble',
  OBSERVACIONES VARCHAR(300) NULL COMMENT 'Observaciones del inmueble',
  CODIGO_TIPO_INMUEBLE VARCHAR(10) NOT NULL COMMENT 'Tipo de inmueble',
  CONSTRAINT PK_INMUEBLE PRIMARY KEY (ID_INMUEBLE),
  CONSTRAINT FK_INMUEBLE_TIPO_INMUEBLE FOREIGN KEY (CODIGO_TIPO_INMUEBLE) REFERENCES TIPO_INMUEBLE(CODIGO_TIPO_INMUEBLE)
);

CREATE TABLE ESTADO (
  CODIGO_ESTADO VARCHAR(10) NOT NULL COMMENT 'Estado del inmueble',
  DESCRIPCION VARCHAR(200) NULL COMMENT 'Descripción del estado del inmueble',
  CONSTRAINT PK_ESTADO PRIMARY KEY (CODIGO_ESTADO)
);

CREATE TABLE TIPO_MOVIMIENTO (
  CODIGO_TIPO_MOVIMIENTO VARCHAR(10) NOT NULL COMMENT 'Tipo de movimiento del inmueble',
  DESCRIPCION VARCHAR(200) NOT NULL COMMENT 'Descripción del tipo de movimiento del inmueble',
  CONSTRAINT PK_TIPO_MOVIMIENTO PRIMARY KEY (CODIGO_TIPO_MOVIMIENTO)
);

CREATE TABLE CLIENTE (
  DNI VARCHAR(9) NOT NULL NOT NULL COMMENT 'DNI del cliente',
  DIRECCION VARCHAR(300) NULL COMMENT 'Dirección del cliente',
  POBLACION VARCHAR(100) NULL COMMENT 'Población del cliente',
  EMAIL VARCHAR(100) NULL COMMENT 'Dirección de correo del cliente',
  TELEFONO VARCHAR(15) NOT NULL COMMENT 'Telefono del cliente',
  NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre del cliente',
  APELLIDOS VARCHAR(150) NOT NULL COMMENT 'Apellidos del cliente',
  CONSTRAINT PK_CLIENTE PRIMARY KEY (DNI)
);

CREATE TABLE HORARIO (
  CODIGO VARCHAR(10) NOT NULL COMMENT 'Código del tipo de horario',
  DESCRIPCION VARCHAR(200) NOT NULL COMMENT 'Descripción del tipo de horario',
  CONSTRAINT PK_HORARIO PRIMARY KEY (CODIGO)
);

CREATE TABLE AGENTE (
  DNI VARCHAR(9) NOT NULL COMMENT 'DNI del Agente',
  DIRECCION VARCHAR(300) NULL COMMENT 'Dirección del Agente',
  POBLACION VARCHAR(100) NULL COMMENT 'Población del Agente',
  EMAIL VARCHAR(100) NULL COMMENT 'Dirección de correo electrónico del Agente',
  TELEFONO VARCHAR(15) NOT NULL COMMENT 'Telefono del Agente',
  NOMBRE VARCHAR(50) NOT NULL COMMENT 'Nombre del Agente',
  APELLIDOS VARCHAR(150) NOT NULL COMMENT 'Apellidos del Agente',
  SALARIO_BASE DECIMAL(12) NOT NULL COMMENT 'Salario base del Agente',
  OBSERVACIONES VARCHAR(300) NULL COMMENT 'Observaciones del Agente',
  HORARIO_CODIGO VARCHAR(10) NOT NULL COMMENT 'Horario del Agente',
  CONSTRAINT PK_AGENTE PRIMARY KEY (DNI),
  CONSTRAINT FK_AGENTE_HORARIO FOREIGN KEY (HORARIO_CODIGO) REFERENCES HORARIO (CODIGO)
);

CREATE TABLE MOVIMIENTO (
  ID_MOVIMIENTO INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del Movimiento',
  FECHA_MOVIMIENTO DATETIME NOT NULL COMMENT 'Fecha del Movimiento',
  PRECIO DECIMAL(12,2) NOT NULL COMMENT 'Precio final del Movimiento',
  ID_INMUEBLE INT NOT NULL COMMENT 'Identificador del Inmueble sobre el que se realizó el alquiler/venta',
  CODIGO_TIPO_MOVIMIENTO VARCHAR(10) NOT NULL COMMENT 'Tipo del Movimiento: alquiler/venta',
  CLIENTE_DNI VARCHAR(9) NOT NULL COMMENT 'DNI del cliente que realizó el movimiento',
  AGENTE_DNI VARCHAR(9) NOT NULL COMMENT 'DNI del agente que realizó el movimiento',
  CONSTRAINT PK_MOVIMIENTO PRIMARY KEY (ID_MOVIMIENTO),
  CONSTRAINT FK_MOVIMIENTO_ID_INMUEBLE FOREIGN KEY (ID_INMUEBLE) REFERENCES INMUEBLE (ID_INMUEBLE),
  CONSTRAINT FK_MOVIMIENTO_TIPO_MOVIMIENTO FOREIGN KEY (CODIGO_TIPO_MOVIMIENTO) REFERENCES TIPO_MOVIMIENTO (CODIGO_TIPO_MOVIMIENTO),
  CONSTRAINT FK_MOVIMIENTO_CLIENTE FOREIGN KEY (CLIENTE_DNI) REFERENCES CLIENTE (DNI),
  CONSTRAINT FK_MOVIMIENTO_AGENTE FOREIGN KEY (AGENTE_DNI) REFERENCES AGENTE (DNI)
);

CREATE TABLE INMUEBLE_ESTADO (
  ID_INMUEBLE INT NOT NULL COMMENT 'Identificador del inmueble',
  CODIGO_ESTADO VARCHAR(10) NOT NULL COMMENT 'Estado del inmueble',
  CONSTRAINT PK_INMUEBLE_ESTADO PRIMARY KEY (ID_INMUEBLE, CODIGO_ESTADO),
  CONSTRAINT FK_INMUEBLE_ESTADO_INMUEBLE FOREIGN KEY (ID_INMUEBLE) REFERENCES INMUEBLE (ID_INMUEBLE),
  CONSTRAINT FK_INMUEBLE_ESTADO_ESTADO FOREIGN KEY (CODIGO_ESTADO) REFERENCES ESTADO (CODIGO_ESTADO)
);

CREATE TABLE COMISION (
  ID_COMISION INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la comisicón',
  IMPORTE DECIMAL(12,2) NOT NULL COMMENT 'Importe de la comisión',
  FECHA_CALCULO DATETIME NOT NULL COMMENT 'Fecha de la comisión',
  AGENTE_DNI VARCHAR(9) NOT NULL COMMENT 'Agente al que le pertenece la comisión',
  CONSTRAINT PK_COMISION PRIMARY KEY (ID_COMISION),
  CONSTRAINT PK_COMISION_AGENTE FOREIGN KEY (AGENTE_DNI) REFERENCES AGENTE (DNI)
);

-- SQL Parte 1º

INSERT INTO tipo_inmueble VALUES ('TI0001','Alquiler'),('TI0002','Venta');
INSERT INTO tipo_movimiento VALUES ('TP0001','Alquiler'),('TP0002','Venta');
INSERT INTO estado VALUES ('ES0001','Alquiler'),('ES0002','Venta');
INSERT INTO horario VALUES ('H0001','Mañana'),('H0002','Tarde'),('H0003','Noche');
INSERT INTO inmueble VALUES (1,'c/Alamillo 1','Manzanares',13200,120000.00,NULL,'2020-01-27 00:00:00','Piso reformado','TI0002'),(2,'c/Lopez Montes 16','Daimiel',13250,NULL,250.00,NULL,'Piso con calefacción','TI0001');
INSERT INTO inmueble_estado VALUES (2,'ES0001'),(1,'ES0002');
INSERT INTO agente VALUES ('05784218V','c/Alicante 15, 2ºB','Ciudad Real','agente@inmobiliaria.es','926213040','Miguel','Lopez',1400,'Agente de ventas','H0001');
INSERT INTO cliente VALUES ('05863471G','c/Toledo 21 4ºC','Ciudad Real','cliente@gmail.com','926213040','Julian','Fernandez Pinto');
INSERT INTO movimiento VALUES (1,'2020-01-27 00:00:00',145000.00,1,'TP0002','05863471G','05784218V');
INSERT INTO comision VALUES (1, 800, '2019-11-29 00:00:00','05784218V'),(2, 1300, '2019-12-30 00:00:00','05784218V'),(3, 1200, '2020-01-27 00:00:00','05784218V');

INSERT INTO agente VALUES ('1111111','c/Alicante 15, 2ºB','Ciudad Real','agente@inmobiliaria.es','926213040','Luis','Lopez',1400,'Agente de ventas','H0001');

INSERT INTO comision VALUES (4, 700, '2023-11-29 00:00:00','1111111'),(5, 900, '2023-12-30 00:00:00','1111111');


-- 2) Genera la siguiente tabla:
CREATE TABLE INMOBILIARIA (
	ID_INMOBILIARIA INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la tabla inmobiliaria',
    NOMBRE VARCHAR (30) NOT NULL COMMENT 'Nombre de la inmobiliaria',
    CIUDAD VARCHAR (100) NOT NULL COMMENT 'Ciudad de la inmobiliaria',
    TELEFONO VARCHAR (15) NOT NULL COMMENT 'Telefono de la inmobiliaria',
    CONSTRAINT PK_INMOBILIARIA PRIMARY KEY (ID_INMOBILIARIA)
);

-- 3) Realiza las siguientes modificaciones de estructura en la base de datos
ALTER TABLE AGENTE
MODIFY COLUMN NOMBRE VARCHAR(100);

-- 4) Introduce los siguientes datos en cada tabla:
INSERT INTO inmobiliaria (NOMBRE, CIUDAD, TELEFONO)
		VALUES ('LA Mayor', 'Madrid', '900110220'),
				('Doncel', 'Ciudad Real', '926217240'),
                ('Correal', 'Toledo', '902102020'),
                ('Cepeda', 'Albacete', '900213040'),
                ('Concasa', 'Mérida', '903754896');

-- 5)
	-- A) Obtener todos los datos de los inmuebles, incluida la descripción del tipo de inmueble
			SELECT I.*, TI.DESCRIPCION
            FROM INMUEBLE AS I, TIPO_INMUEBLE AS TI
            WHERE I.CODIGO_TIPO_INMUEBLE = TI.CODIGO_TIPO_INMUEBLE;
            
            SELECT * FROM TIPO_INMUEBLE;
	
    -- B) Obtener el DNI, NOMBRE, APELLIDOS de los Agentes, así como la DESCRIPCIÓN del horario de cada Agente.
			SELECT AG.DNI AS DNI_AGENTE, AG.NOMBRE AS NOMBRE_AGENTE, AG.APELLIDOS AS APELLIDO_AGENTE, HO.DESCRIPCION AS DESCRIPCION_HORARIO
            FROM AGENTE AS AG, HORARIO AS HO
            WHERE AG.HORARIO_CODIGO = HO.CODIGO;
            
	-- C) Lista las comisiones obtenidas por cada Agente, devuelve DNI, NOMBRE, TELEFONO, SALARIO BASE de los Agentes, 
	-- 	   así como el IMPORTE y FECHA_CALCULO de cada comisión de los Agentes.
            SELECT AG.DNI, AG.TELEFONO, AG.SALARIO_BASE, COM.IMPORTE, COM.FECHA_CALCULO
            FROM AGENTE AS AG, COMISION AS COM
            WHERE AG.dni = COM.agente_dni;
            
	-- G) Obtener el ID_MOVIMIENTO, FECHA_MOVIMIENTO, PRECIO del Cliente con número de teléfono 926213040, 
	--    siempre que sean movimientos realizados en el año 2020.
			SELECT M.ID_MOVIMIENTO, M.FECHA_MOVIMIENTO, M.PRECIO, C.TELEFONO
            FROM MOVIMIENTO AS M, CLIENTE AS C
            WHERE M.CLIENTE_DNI = C.DNI AND C.TELEFONO = '926213040'
            AND YEAR(M.FECHA_MOVIMIENTO) = 2020;
            
	-- H) Aplicar una subida del 15% al precio de venta de los inmuebles de tipo TI0002.
			UPDATE INMUEBLE 
            SET PRECIO_VENTA = PRECIO_VENTA * 1.15
            WHERE CODIGO_TIPO_INMUEBLE = 'TI0002';
            
	-- I) Borra los datos de aquellas inmobiliarias que no tengan inmuebles registrados.
            
            
            
-- SQL Parte 2º  
          
INSERT INTO tipo_inmueble VALUES ('TI0001','Alquiler'),('TI0002','Venta');
INSERT INTO tipo_movimiento VALUES ('TP0001','Alquiler'),('TP0002','Venta');
INSERT INTO estado VALUES ('ES0001','Alquiler'),('ES0002','Venta');
INSERT INTO horario VALUES ('H0001','Mañana'),('H0002','Tarde'),('H0003','Noche');
INSERT INTO inmueble VALUES (1,'c/Alamillo 1','Manzanares',13200,120000.00,NULL,'2020-01-27 00:00:00','Piso reformado','TI0002'),(2,'c/Lopez Montes 16','Daimiel',13250,NULL,250.00,NULL,'Piso con calefacción','TI0001');
INSERT INTO inmueble_estado VALUES (2,'ES0001'),(1,'ES0002');

INSERT INTO agente VALUES 
('05784218V','c/Alicante 15, 2ºB','Ciudad Real','agente1@inmobiliaria.es','926213040','Miguel','Lopez',1400,'Agente de ventas','H0001'),
('87452147P','c/Alicante 15, 2ºB','Ciudad Real','agente2@inmobiliaria.es','926213040','Luis','Lopez',1400,'Agente de ventas','H0001'),
('21365478D','c/Burgos 15, 2ºB','Ciudad Real','agente3@inmobiliaria.es','926213040','Nicolas','Cosoui',3000,'Agente de ventas','H0001'),
('95478568M','c/Teruel 15, 2ºB','Ciudad Real','agente4@inmobiliaria.es','926213040','Manuel','Gonzalez',1800,'Agente de ventas','H0001');

INSERT INTO cliente VALUES ('05863471G','c/Toledo 21 4ºC','Ciudad Real','cliente1@gmail.com','926213040','Julian','Fernandez Pinto'),
('74125896K','c/Toledo 21 4ºC','Ciudad Real','cliente2@gmail.com','926213040','Julian','Fernandez Pinto'),
('85412364F','c/Lugo 22','Manzanares','cliente3@gmail.com','926213040','Julian','Fernandez Pinto'),
('95123458S','c/Sevilla 54','Daimiel','cliente4@gmail.com','926213040','Julian','Fernandez Pinto'),
('75321485M','c/Segura 45','Ciudad Real','cliente5@gmail.com','926213040','Julian','Fernandez Pinto');

INSERT INTO movimiento VALUES (1,'2020-01-27 00:00:00',145000.00,1,'TP0002','05863471G','05784218V');
INSERT INTO movimiento VALUES (2,'2025-01-30 00:00:00',145000.00,1,'TP0002','74125896K','05784218V');
INSERT INTO movimiento VALUES (3,'2025-01-30 00:00:00',145000.00,1,'TP0002','75321485M','05784218V');
INSERT INTO movimiento VALUES (4,'2025-01-30 00:00:00',145000.00,1,'TP0002','85412364F','87452147P');
INSERT INTO movimiento VALUES (5,'2025-01-30 00:00:00',145000.00,1,'TP0001','85412364F','87452147P');
INSERT INTO movimiento VALUES (6,'2025-01-30 00:00:00',145000.00,1,'TP0001','95123458S','21365478D');
INSERT INTO movimiento VALUES (7,'2025-01-30 00:00:00',145000.00,1,'TP0002','75321485M','95478568M');
INSERT INTO movimiento VALUES (8,'2025-01-30 00:00:00',145000.00,1,'TP0002','74125896K','95478568M');

INSERT INTO comision VALUES (1, 800, '2019-11-29 00:00:00','05784218V'),
(2, 1300, '2019-12-30 00:00:00','05784218V'),
(3, 1200, '2020-01-27 00:00:00','87452147P'),
(4, 700, '2023-11-29 00:00:00','21365478D'),
(5, 900, '2023-12-30 00:00:00','87452147P');            
            

/*Explicacion del Group By*/
SELECT AG.DNI, AG.NOMBRE, COUNT(*) AS NUM_MOVIMIENTOS /*La funcion Count cuenta*/
FROM AGENTE AS AG, MOVIMIENTO AS M
WHERE AG.DNI = M.AGENTE_DNI
GROUP BY AG.DNI, AG.NOMBRE
ORDER BY NUM_MOVIMIENTOS;


            
