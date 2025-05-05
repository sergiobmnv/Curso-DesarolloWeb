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