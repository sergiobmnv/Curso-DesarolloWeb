USE COLEGIO;

-- 2) Inserta los datos necesarios para representar los siguientes elementos.
		
        -- INSERTAR DATOS A LA TABLA CURSO
			INSERT INTO CURSO (ID_CURSO, NOMBRE, IND_VISIBLE)
					VALUES (1, 'DAM_DAW 1', 1),
							(2, 'DAM 2', 1),
                            (3, 'DAW 2', 1);
                            
		-- INSERTAR DATOS A LA TABLA ASIGNATURA
			INSERT INTO ASIGNATURA (NOMBRE, HORAS, IND_VISIBLE, ID_CURSO)
					VALUES ('Bases de Datos', 5, 1, 1),
							('Programación', 6, 1, 1),
							('Inglés', 2, 1, 1),
							('Acceso a Datos', 7, 1, 2),
							('Desarrollo de Interfaces', 5, 1, 2),
							('Sistemas de Gestión Empresarial', 5, 1, 2);
                            
		-- INSERTAR DATOS A LA TABLA TIPO_EMPLEADO
			INSERT INTO TIPO_EMPLEADO (ID_TIPO_EMPLEADO, NOMBRE_TIPO, IND_PROFESOR, IND_VISIBLE)
					VALUES (1, 'Profesor', 1, 1),
							(2, 'Administrativo', 0, 1);
                            
		-- INSERTAR DATOS A LA TABLA EMPLEADO
			INSERT INTO EMPLEADO (NOMBRE, APELLIDOS, DNI, DOMICILIO, CODIGO_POSTAL, EMAIL, IND_VISIBLE, ID_TIPO_EMPLEADO)
					VALUES ('Juan', 'Pérez López', '12345678A', 'Calle Falsa 123', 28001, 'juan.perez@colegio.com', 1, 1),
							('María', 'García Gómez', '23456789B', 'Avenida Siempreviva 45', 28002, 'maria.garcia@colegio.com', 1, 1),
							('Pedro', 'López Martínez', '34567890C', 'Plaza Mayor 10', 28003, 'pedro.lopez@colegio.com', 1, 1),
							('Ana', 'Martínez Ruiz', '45678901D', 'Calle de las Flores 8', 28004, 'ana.martinez@colegio.com', 1, 2),
							('Laura', 'Fernández Díaz', '56789012E', 'Camino Verde 15', 28005, 'laura.fernandez@colegio.com', 1, 2);
                            
		-- INSERTA DATOS A LA TABLA IMPARTE
			INSERT INTO IMPARTE (IND_VISIBLE, ID_ASIGNATURA, ID_EMPLEADO)
					VALUES (1, 1, 1),
							(1, 2, 2),
							(1, 4, 3);
                            
-- 3) Consulta los siguientes datos.

		-- A) 
			SELECT A.NOMBRE, A.HORAS, C.NOMBRE AS CURSO
			FROM ASIGNATURA A, CURSO C
			WHERE A.ID_CURSO = C.ID_CURSO AND (A.HORAS > 6 OR C.NOMBRE = 'DAM 1');
		
        -- B) 
			SELECT E.NOMBRE, E.APELLIDOS, E.DOMICILIO, E.CODIGO_POSTAL
			FROM EMPLEADO E, TIPO_EMPLEADO TE
			WHERE E.ID_TIPO_EMPLEADO = TE.ID_TIPO_EMPLEADO AND TE.NOMBRE_TIPO = 'Profesor' AND E.CODIGO_POSTAL = 28001;

		-- C) 
			SELECT A.NOMBRE, A.HORAS
			FROM ASIGNATURA A, CURSO C
			WHERE A.ID_CURSO = C.ID_CURSO AND A.IND_VISIBLE = 1 AND C.NOMBRE = 'SMR 1';

        -- D) 
			SELECT NOMBRE, APELLIDOS, DOMICILIO
			FROM EMPLEADO
			WHERE NOMBRE = 'María' AND DOMICILIO IS NULL;

        -- E) 
			SELECT NOMBRE, HORAS
			FROM ASIGNATURA
			WHERE HORAS BETWEEN 4 AND 8;
            
        -- F) 
			SELECT NOMBRE, HORAS
			FROM ASIGNATURA
			WHERE IND_VISIBLE = 1 AND HORAS <= 3;
            
        -- G)
			SELECT A.NOMBRE, A.HORAS, C.NOMBRE AS CURSO
			FROM ASIGNATURA A, CURSO C
			WHERE A.ID_CURSO = C.ID_CURSO AND A.IND_VISIBLE = 1 AND (A.HORAS > 5 OR C.NOMBRE IN ('DAM 1', 'DAW 2'));


-- 4) Realiza las siguientes modificaciones.

		-- A)
			UPDATE CURSO
			SET NOMBRE = 'DESARROLLO DE APLICACIONES WEB 2'
			WHERE ID_CURSO = 2;
            
        -- B)
			UPDATE ASIGNATURA
			SET IND_VISIBLE = 0
			WHERE HORAS > 6;
            
        -- C)
			UPDATE EMPLEADO
			SET CODIGO_POSTAL = 13605
			WHERE DNI = '78945612B';
            
        -- D)
			-- Primero, se necesita encontrar el ID_TIPO_EMPLEADO correspondiente a "ADMINISTRATIVO".
			SELECT ID_TIPO_EMPLEADO FROM TIPO_EMPLEADO WHERE NOMBRE_TIPO = 'Administrativo';
			UPDATE EMPLEADO
			SET ID_TIPO_EMPLEADO = 2
			WHERE NOMBRE = 'Jose Angel';
            
        -- E)
        UPDATE ASIGNATURA
		SET IND_VISIBLE = 1
		WHERE IND_VISIBLE = 0;
        




